<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.Enumeration"
    %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <div class="table-responsive">
  <table class="table table-hover text-center" id="shoppingCartList"> --%>
    <thead class="table-dark">
      <tr>
        <td>商品編號</td>
        <td>商品名稱</td>
        <td>數量</td>
        <td>單價</td>
        <td>小計</td>
        <td>刪除</td>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${ShoppingCart.getShoppingMap()}" var="Corder_detail" varStatus="status">
       <tr>
         <td><span id="product_Id${ status.count }">${ Corder_detail.value.product_Id }</span></td>
         <td>${ Corder_detail.value.product_Name }</td>
         <td class="numwidth">
           <!--此處的#stock value從資料庫讀取-->
           <div class="row">
             <div class="col mx-auto">
               <input id="stock${ status.count }" type="hidden" name="stock${ status.count }" value="${ Corder_detail.value.getProduct(Corder_detail.value.product_Id).stock }"/>
               <div class="input-group">
                 <button class="btn btn-outline-primary" type="button" onclick="getnum(${ status.count },'-')">－</button>
                 <input class="form-control text-center px-1 border-primary" type="tel" value="${ Corder_detail.value.single_buynum }" name="buynum${ status.count }" id="buynum${ status.count }" onchange="setbuynum(${ status.count });"/>
                 <button class="btn btn-outline-primary" type="button" onclick="getnum(${ status.count },'+')">＋</button>
               </div>
             </div>
           </div>
         </td>
           <td>NT$ <span id="product_price${ status.count }">${ Corder_detail.value.product_price }</span></td>
           <td>NT$ <span id="subtotal${ status.count }">${ Corder_detail.value.product_price * Corder_detail.value.single_buynum }</span>
         </td>
         <td><a onclick="removeItemShoppingCart('${ status.count }','${ Corder_detail.value.product_Id }','${ Corder_detail.value.product_Name }')" href="#run" style="text-decoration: none;">❌</a></td>
       </tr>
      </c:forEach>
    </tbody>
    <tfoot class="fw-bold">
      <tr>
        <td id="Products_Total" class="text-end" colspan="4">商品金額總計</td>
        <!-- ${pageScope.subtotal = ShoppingCart.totalAllMoney()} -->
        <td colspan="2">NT$ <span id="subtotal_sum">${pageScope.subtotal}</span></td>
      </tr>
        <tr>
          	<td class="text-end" colspan="4">運費</td>
            <%			        	
	            String transport = request.getParameter("transport");
	            
	            long subtotal = 0;
	            if ( pageContext.findAttribute("subtotal") != null) {
	                subtotal = (int) pageContext.findAttribute("subtotal");
	            }
	        	
	        	//帶入運費方式及商品總金額，回傳運費
	        	int transportfee = service.ShoppingCartService.transportfee(transport, subtotal);
	       		pageContext.setAttribute("transportfee", transportfee);
		        
		    %>
          <td colspan="2">NT$ <span id="transportfee">${ pageScope.transportfee }</span></td>
        </tr>
      <tr>
        <td id="Corder_Total" class="text-end text-primary h5 fw-bold" colspan="4">總計</td>
        <td class="text-primary" colspan="2">NT$ <span id="sum">${ pageScope.subtotal + pageScope.transportfee }</span></td>
      </tr>
    </tfoot>
<%--
  </table>
</div> --%>