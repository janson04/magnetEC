<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Service.ShoppingCartService"
    import="Model.Product"
    %>
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
	//SC.processRequest(request);


	if (request.getParameter("submit") != null){
		//如果submit=add 且 num 不為空，則執行新增至購物車
		if (request.getParameter("submit").equals("add") && request.getParameter("num") != null){
			Product p = (Product) request.getSession().getAttribute("showProduct");
			int buynum = Integer.parseInt(request.getParameter("num"));
			SC.addProduct(p,buynum);
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
		      <div class="row">
		        <div class="col-4"><img src="images/product/${ Corder_detail.value.product_Id }.jpg" alt="" height="80px"/></div>
		        <div class="col-8">
		          <div class="row name">${ Corder_detail.value.product_Name }</div>
		          <div class="row qty">數量  : ${ Corder_detail.value.single_buynum }</div>
		        </div>
		      </div>
		    </c:forEach>
	    </div>
	    <c:if test="${ShoppingCart.shoppingMapSize()>0 }"><hr/></c:if>
	    <div class="row col">
	      <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#checkoutPage">結帳</button>
	    </div>
	  </div>
	</div>
</body>
</html>