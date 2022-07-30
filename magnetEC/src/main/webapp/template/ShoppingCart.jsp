<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="service.ShoppingCartService"
    import="model.Product"
    import="dao.ProductDaoImpl"
    %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ShoppingCartService SC = (ShoppingCartService) request.getSession().getAttribute("ShoppingCart");
	
	//如果還沒有購物車的Session，創建一個
	if (SC == null) {
		SC = new ShoppingCartService();
		request.getSession().setAttribute("ShoppingCart", SC);
	}
%>

<%
	System.out.println("submit: "+request.getParameter("submit"));
	System.out.println("productId: "+request.getParameter("productId"));
	
	if (request.getParameter("submit") != null){
		//如果submit=add 且 buynum 不為空，則執行新增至購物車
		if (request.getParameter("submit").equals("add") && request.getParameter("buynum") != null){
	//購物車商品增加購買數量
	Product p = new ProductDaoImpl().queryforProductId(request.getParameter("productId"));
	int buynum = Integer.parseInt(request.getParameter("buynum"));
	SC.addProduct(p,buynum);
		} else if (request.getParameter("submit").equals("modify")){
	//購物車商品修改至指定數量
	int buynum = Integer.parseInt(request.getParameter("buynum"));
	SC.modifyProduct(request.getParameter("productId"),buynum);
		} else if (request.getParameter("submit").equals("remove")) {
	//購物車移除購買商品
	boolean removeSuccess = SC.deleteProduct(request.getParameter("productId"));
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