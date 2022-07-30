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
                 <input class="form-control text-center px-1 border-start-0 border-end-0 border-primary" type="tel" value="${ Corder_detail.value.single_buynum }" name="buynum${ status.count }" id="buynum${ status.count }" onchange="setbuynum(${ status.count });"/>
                 <button class="btn btn-outline-primary" type="button" onclick="getnum(${ status.count },'+')">＋</button>
               </div>
             </div>
           </div>
         </td>
         <td>NT$ <span id="product_price${ status.count }">${ Corder_detail.value.product_price }</span></td>
         <td>NT$ <span id="subtotal${ status.count }">${ Corder_detail.value.product_price * Corder_detail.value.single_buynum }</span>
         		<!-- 小計累加已至: ${ pageScope.subtotal = pageScope.subtotal + Corder_detail.value.product_price * Corder_detail.value.single_buynum } -->
         </td>
         <td><a onclick="removeItemShoppingCart('${ status.count }','${ Corder_detail.value.product_Id }','${ Corder_detail.value.product_Name }')" href="#run" style="text-decoration: none;">❌</a></td>
       </tr>
      </c:forEach>
    </tbody>
    <tfoot class="fw-bold">
      <tr>
        <td id="Products_Total" class="text-end" colspan="4">商品金額總計</td>
        <td colspan="2">NT$ <span id="subtotal_sum">${ pageScope.subtotal == null ? 0 : pageScope.subtotal }</span></td>
      </tr>
      <tr>
        <td class="text-end" colspan="4">運費</td>
        <%
	     	// 取出所有Parameter
	        System.out.println("------開始取出Parameter------");
	
	        // 返回包含名稱的字符串對象的Enumeration
	        // 此request中包含的parameters。
	        Enumeration paramNames = request.getParameterNames();
	
	        // 如果enumeration包含更多的 elements，則讀取下一個(nextElement)繼續取出
	        while (paramNames.hasMoreElements()) {
	             String paraName = (String)  paramNames.nextElement();
	             System.out.print(paraName + ": ");
	             String[] paramValues =  request.getParameterValues(paraName);
	             // 當此參數只有一個時
	             if (paramValues.length == 1) {
	                 String paramValue = paramValues[0];
	                 if (paramValue.length() == 0) {
	                      System.out.println("null");
	                 } else {
	                      System.out.println(paramValue);
	                 }
	             } else {
	                 // 當此參數有好幾個值時
	                 for (int i = 0; i < paramValues.length; i++) {
	                      System.out.print(paramValues[i]+"\t");
	                 }
	                 System.out.println("");
	             }
	        }
	        System.out.println("------結束取出Parameter------");
        
	        
        	long transportThreshold = 1000;	//設定運費優惠門檻
        	
        	String transport = (String) request.getParameter("transport");
        	if (transport == null) {
        		//如果為空，預設為宅配(delivery)
        		transport = "delivery";
        	}
        	
        	long subtotal = 0;
        	if ( pageContext.findAttribute("subtotal") != null) {
        		subtotal = (long) pageContext.findAttribute("subtotal");
        	}
        	
        	//判斷運費為何
       		switch (transport) {
                   case "delivery":
	                   	if (subtotal >= transportThreshold ) {
	                   		pageContext.setAttribute("transportfee", 0);
	                   	}else{
	                   		pageContext.setAttribute("transportfee", 60);
	                   	}
	                       System.out.println("運送方式: delivery(宅配)");
	                       break;
                   case "cashondelivery":
	                   	if (subtotal >= transportThreshold ) {
	                   		pageContext.setAttribute("transportfee", 50);
	                   	}else{
	                   		pageContext.setAttribute("transportfee", 80);
	                   	}
	                       System.out.println("運送方式: cashondelivery(貨到付款)");
	                       break;
                   default:
                	    pageContext.setAttribute("transportfee", 999);
	                    System.out.println("非宅配或是貨到付款");
               }
        
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