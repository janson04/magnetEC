<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="service.ShoppingCartService"
    import="model.Product"
    import="model.Users"
    import="model.Shoppingcart"
    import="dao.ProductDaoImpl"
    import="dao.ShoppingcartDaoImpl"
	import="java.util.List"
    %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ShoppingCartService SC = (ShoppingCartService) request.getSession().getAttribute("ShoppingCart");

	Users user = (Users) request.getSession().getAttribute("user");
	String users_id = null;
	if (user != null) {
		users_id = user.getUsers_id();
	}
	
	//如果還沒有購物車的Session，創建一個
	if (SC == null || (SC != null && SC.shoppingMapSize() == 0)) {
		SC = new ShoppingCartService();
		//如果有登入 (user不為null)，讀取此uid的購物車清單
		if (users_id != null){
			List<Shoppingcart> lsc = new dao.ShoppingcartDaoImpl().queryUIDList(users_id);
			for (Shoppingcart sc:lsc) {
				System.out.println(sc);
				Product p = new ProductDaoImpl().queryforProductId(sc.getProduct_Id());
				int singlebuynum = sc.getSingleBuynum();
				if (p != null) {
					SC.addProduct(p,singlebuynum);
				}
			}
			
		}
		
		request.getSession().setAttribute("ShoppingCart", SC);
	}
%>

<%
	//System.out.println("ShoppingCart.jsp submit: "+request.getParameter("submit"));
	//System.out.println("ShoppingCart.jsp productId: "+request.getParameter("productId"));
	
	if (request.getParameter("submit") != null){
		//如果submit不為空，則執行購物車相關操作
		String productId = request.getParameter("productId");
		
		if (request.getParameter("submit").equals("add") && request.getParameter("buynum") != null){
			//購物車商品增加購買數量
			Product p = new ProductDaoImpl().queryforProductId(productId);
			int buynum = Integer.parseInt(request.getParameter("buynum"));
			SC.addProduct(p,buynum);
			
			//20220730新增: 回存至Shoppingcart資料庫操作
			if (users_id != null) {
				boolean updateSuccess = new ShoppingcartDaoImpl().add(users_id, productId, SC.getShoppingMap().get(productId).getSingle_buynum());
				System.out.println("ShoppingCart.jsp 新增: " + updateSuccess);
			}
			
		} else if (request.getParameter("submit").equals("modify") && request.getParameter("buynum") != null){
			//購物車商品修改至指定數量
			int buynum = Integer.parseInt(request.getParameter("buynum"));
			SC.modifyProduct(productId,buynum);
			
			//20220730新增: 回存至Shoppingcart資料庫操作
			if (users_id != null) {
				boolean updateSuccess = new ShoppingcartDaoImpl().update(users_id, productId, SC.getShoppingMap().get(productId).getSingle_buynum());
				System.out.println("ShoppingCart.jsp 修改: " + updateSuccess);
			}
			
		} else if (request.getParameter("submit").equals("remove")) {
			//購物車移除購買商品
			boolean removeSuccess = SC.deleteProduct(productId);
			
			//20220730新增: 回存至Shoppingcart資料庫操作
			if (users_id != null) {
				boolean deleteSuccess = new ShoppingcartDaoImpl().deleteUIDPID(users_id , productId);
				System.out.println("ShoppingCart.jsp 刪除: " + deleteSuccess);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<body>
	<div class="modal-content">
	  <div class="modal-body">
	    <div class="container">
		    <c:forEach items="${ShoppingCart.getShoppingMap()}" var="Corder_detail">
		      <a href="/magnetEC/products_detail?id=${ Corder_detail.value.product_Id }">
		      	<div class="row">
			        <div class="col-4"><img src="/magnetEC/images/product/${ Corder_detail.value.product_Id }.jpg" alt="" height="80px"/></div>
			        <div class="col-8">
			          <div class="row name">${ Corder_detail.value.product_Name }</div>
			          <div class="row qty">數量  : ${ Corder_detail.value.single_buynum }</div>
			        </div>
		      	</div>
		       </a>
		    </c:forEach>
	    </div>
	    <c:if test="${ShoppingCart.shoppingMapSize()>0 }"><hr/></c:if>
	    <div class="row col">
	    	<c:choose>
				<c:when test="${empty sessionScope.ssid}">
					<button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#checkoutPage">結帳</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-success" type="button" data-bs-toggle="modal" onclick="location.href='/magnetEC/cart/cart_start.jsp';">結帳</button>
				</c:otherwise>
			</c:choose>
	      	
	    </div>
	  </div>
	</div>
</body>
</html>