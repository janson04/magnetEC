<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // 驗證機制 - param.transportRadios & param.payRadios
	// 判斷是否有運送方式跟付款方式的param，不然就切回結帳的第一頁
	if (request.getParameter("transportRadios") == null || request.getParameter("payRadios") == null) {
		// 跳轉至結帳第一頁
		response.sendRedirect("cart_start.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單 - 磁鐵超市</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="../css/cart.css" type="text/css" />
<%-- 此頁CSS載入結束 --%>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.core.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.default.min.css'>
<link rel="stylesheet" href="../css/navfooter.css" type="text/css" />
<link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
</head>
<body>
<div id="nav">
	<jsp:include page="../template/nav.jsp"></jsp:include>
</div>
<%-- 開始 --%>
	<div class="header jumbotron" style="margin-top: 70px;"></div>
	<section class="mx-2 mt-3">
	  <div class="row col-12">
	    <!--層次結構導航-->
	    <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
	      <div class="col">
	        <h5>
	          <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
	            <ol class="breadcrumb">
	              <li class="breadcrumb-item"><a href="/magnetEC/index.jsp">首頁</a></li>
	              <li class="breadcrumb-item"><a href="/magnetEC/product?magnetType=all">磁鐵購買</a></li>
	              <li class="breadcrumb-item active" aria-current="page">購物車</li>
	            </ol>
	          </nav>
	        </h5>
	      </div>
	    </div>
	  </div>
	  <!--流程-->
	  <div class="container row col-12 col-md-10 mx-auto mt-3">
	    <div class="fs-2 fw-bold text-center">購物車</div>
	    <div class="my-2 mx-auto">
	      <div class="row col-9 col-lg-8 mx-auto">
	        <div class="position-relative m-4">
	          <div class="progress" style="height: 1px;">
	            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
	          </div>
	          <div class="row">
	            <div class="col d-none d-sm-block">
	              <button class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-secondary rounded-pill" type="button" style="width: 10rem; height:2.3rem;">01 / 運送付款方式</button>
	            </div>
	            <div class="col">
	              <button class="position-absolute top-0 translate-middle btn btn-sm btn-primary rounded-pill" type="button" style="width: 10rem; height:2.3rem; left: 46%">02 / 填寫訂購資料</button>
	            </div>
	            <div class="col d-none d-sm-block">
	              <button class="position-absolute top-0 translate-middle btn btn-sm btn-secondary rounded-pill" type="button" style="width: 10rem; height:2.3rem; left: 92%">03 / 完成訂購</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  <!--運送付款方式-->
	  <div class="container-fluid row col-12 my-3 mx-0">
	    <div class="row col-12 col-sm-10 col-lg-8 mt-5 mx-auto text-center">
	      <div class="row justify-content-center">
	        <!--運送方式-->
	        <div class="col-12 col-md-8 col-lg-6 fs-4 mt-2">
	            <i class="fas fa-truck">選擇的運送方式：
		            <div class="fas">
		            	<c:choose>
		            		<c:when test="${param.transportRadios == 'delivery'}">
		            			 宅配
		            		</c:when>
		            		<c:when test="${param.transportRadios == 'cashondelivery'}">
		            			 貨到付款
		            		</c:when>
		            		<c:when test="${param.transportRadios == 'pick711'}">
		            			 7-11純取貨
		            		</c:when>
		            		<c:when test="${param.transportRadios == 'pickpay711'}">
		            			 7-11取貨付款
		            		</c:when>
		            		<c:otherwise>
		            			 錯誤的運送方式
		            		</c:otherwise>
		            	</c:choose>
		            </div>
	            </i>
	        </div>
	        <!--付款方式-->
	        <div class="col-12 col-md-8 col-lg-6 fs-4 mt-2">
	            <i class="fas fa-money-bill-1-wave">選擇的付款方式：
	            	<div class="fas">
		            	<c:choose>
		            		<c:when test="${param.payRadios == 'remittance'}">
		            			 匯款
		            		</c:when>
		            		<c:when test="${param.payRadios == 'creditcard'}">
		            			 線上刷卡
		            		</c:when>
		            		<c:when test="${param.payRadios == 'payondelivery'}">
		            			 貨到付款
		            		</c:when>
		            		<c:otherwise>
		            			 錯誤的付款方式
		            		</c:otherwise>
		            	</c:choose>
	            	</div>
	            </i>
	         </div>
	      </div>
	    </div>
	    <div class="row col-12 col-md-10 col-lg-8 mt-4 mx-auto px-0">
	      <div class="fs-4 mt-3 mb-2">
	        <i class="fas fa-list"><div class="fas"> 購物清單</div></i>
	        <div class="d-sm-none fs-6 text-danger fw-bold">(行動裝置可左右滑動明細)</div>
	      </div>
	      <div class="table-responsive">
	        <table class="table table-hover text-center" id="shoppingCartList">
	          <thead class="table-dark">
	            <tr>
	              <td>商品編號</td>
	              <td>商品名稱</td>
	              <td>數量</td>
	              <td>單價</td>
	              <td>小計</td>
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
					          <div id="stock1">${ Corder_detail.value.single_buynum }</div>
						    </div>
						  </div>
						</td>
						<td>NT$ <span id="product_price${ status.count }">${ Corder_detail.value.product_price }</span></td>
						<td>NT$ <span id="subtotal${ status.count }">${ Corder_detail.value.product_price * Corder_detail.value.single_buynum }</span>
								<!-- 小計累加已至: ${ pageScope.subtotal = pageScope.subtotal + Corder_detail.value.product_price * Corder_detail.value.single_buynum } -->
						</td>
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
	                	/*
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
			        	*/
			        
			        	long transportThreshold = 1000;	//設定運費優惠門檻
			        	
			        	String transport = (String) request.getParameter("transportRadios");
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
				                    //System.out.println("運送方式: delivery(宅配)");
				                    break;
			                   case "cashondelivery":
				                   	if (subtotal >= transportThreshold ) {
				                   		pageContext.setAttribute("transportfee", 50);
				                   	}else{
				                   		pageContext.setAttribute("transportfee", 80);
				                   	}
				                    //System.out.println("運送方式: cashondelivery(貨到付款)");
				                    break;
			                   default:
			                	    pageContext.setAttribute("transportfee", 999);
				                    System.out.println("非宅配或是貨到付款");
			               }
			        
			        %>
			        <td colspan="2">NT$ <span id="transportfee">${ pageScope.transportfee }</span></td>
	            </tr>
	            <tr>
	              <td class="text-end text-primary h5 fw-bold" colspan="4">總計</td>
	              <td class="text-primary" colspan="2">NT$ <span id="sum">${ pageScope.subtotal + pageScope.transportfee }</span></td>
	            </tr>
	          </tfoot>
	        </table>
	      </div>
	    </div>
	  </div>
	</section>
	
	<!--訂購資訊+發票資訊-->
      <form id="orderdetail" class="row g-3 position-relative needs-validation" action="CorderSend"
        method="post" novalidate>
        <section class="mx-2 mt-4">
            <div class="container">
                <div class="fs-3 fw-bold text-center">
                    <div class="fas fa-user-pen"> 填寫訂購資訊</div>
                </div>
                <div class="row col-12 col-md-10 mx-auto">
                    <div class="form-text text-center mb-3">為了正確配送商品，請務必輸入正確的資料，謝謝您</div>
                </div>
                
                <input type="hidden" name="transport" value="${param.transportRadios}" / >
                <input type="hidden" name="pay" value="${param.payRadios}" / >
                
                <div class="container col-12 col-lg-9" id="OrderShippingInformation">
                	<div class="row g-3 position-relative">
                    <div class="col-lg-4 position-relative">
                        <div class="row">
                            <label class="form-label" for="users_id"><span>帳號</span></label>
                            <div class="input-group has-validation"><span class="input-group-text">@</span>
                                <input class="form-control" id="users_id" name="users_id" type="text" aria-describedby="帳號"
                                    value="${ sessionScope.user == null ? '非會員購買' : sessionScope.user.users_id }" readonly />
                                <div class="invalid-feedback">未輸入或發現重複的帳號</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 position-relative">
		                    <label class="form-label d-lg-block d-none" for="users_id"><span>　</span></label>
		                    <div class="form-check d-flex align-items-center" style="line-height: 38px">
							  <input class="form-check-input" type="checkbox" value="" id="SyncData"  <c:if test="${sessionScope.user == null}">disabled</c:if> >
							  <label class="form-check-label" for="SyncData">
									&nbsp此訂單之資料，同步更新至帳號個人資料
							  </label>
							</div>
                    </div>
                    <div class="col-lg-3 position-relative">
                        <input id="readname" type="hidden" value="${sessionScope.user.name}" />
                        <label class="form-label" for="name">姓名<span class="small text-danger"> (必填)</span></label>
                        <input class="form-control" id="name" name="name" type="text" required />
                        <div class="invalid-feedback">請輸入姓名</div>
                    </div>
                    <div class="col-lg-4 position-relative">
                        <input id="readphone" type="hidden" value="${sessionScope.user.phone}" />
                        <label class="form-label" for="phone">手機<span class="small text-danger"> (必填)</span></label>
                        <input class="form-control" id="phone" name="phone" type="text" pattern="^[0][9][0-9]{8}$"
                            required />
                        <div class="valid-feedback">輸入正確</div>
                        <div class="invalid-feedback">請輸入正確的手機號碼</div>
                    </div>
                    <div class="col-lg-5 position-relative">
                        <input id="reademail" type="hidden" value="${sessionScope.user.email}" />
                        <label class="form-label" for="email">Email</label>
                        <input class="form-control" id="email" name="email" type="email"
                            value="${sessionScope.user.email}" />
                        <!--
                        <div class="valid-feedback">輸入正確</div>
                        <div class="invalid-feedback">請輸入正確的Email</div>
                        -->
                    </div>
                    <div class="col-lg-3 position-relative">
                        <input id="readcity" type="hidden" value="${sessionScope.user.city}" />
                        <label class="form-label" for="city">縣市<span class="small text-danger"> (必填)</span></label>
                        <select class="form-select" id="city" name="city" aria-describedby="請選擇縣市" required >
                            <option disabled>請選擇</option>
                            <option>台北市</option>
                            <option>新北市</option>
                            <option>桃園市</option>
                            <option>台中市</option>
                            <option>台南市</option>
                            <option>高雄市</option>
                            <option>基隆市</option>
                            <option>新竹市</option>
                            <option>嘉義市</option>
                            <option>新竹縣</option>
                            <option>苗栗縣</option>
                            <option>彰化縣</option>
                            <option>南投縣</option>
                            <option>雲林縣</option>
                            <option>嘉義縣</option>
                            <option>屏東縣</option>
                            <option>宜蘭縣</option>
                            <option>花蓮縣</option>
                            <option>台東縣</option>
                            <option>澎湖縣</option>
                        </select>
                        <div class="invalid-feedback">請選擇所在的縣市</div>
                    </div>
                    <div class="col-lg-3 position-relative">
                        <input id="readpostcode" type="hidden" value="${sessionScope.user.postcode}" />
                        <label class="form-label" for="postcode">郵遞區號<span class="small text-danger"> (必填)</span></label>
                        <input class="form-control" id="postcode" name="postcode" value="${sessionScope.user.postcode}"
                            type="tel" aria-describedby="請輸入郵遞區號" pattern="[0-9]{3,6}" required />
                        <div class="invalid-feedback">請輸入正確的郵遞區號</div>
                    </div>
                    <div class="col-lg-6 position-relative">
                        <input id="readaddress" type="hidden" value="${sessionScope.user.address}" />
                        <label class="form-label" for="address">送貨地址<span class="small text-danger"> (必填)</span></label>
                        <input class="form-control" id="address" name="address" value="${sessionScope.user.address}"
                            type="text" aria-describedby="請輸入送貨地址" required />
                        <div class="invalid-feedback" id="validationServer03Feedback">請輸入正確的地址</div>
                    </div>
                    <div class="col-12 position-relative">
                        <label class="form-label" for="notes">訂單備註</label>
                        <textarea class="form-control" id="notes" name="notes" aria-describedby="請輸入訂單備註"></textarea>
                    </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="mx-2 mt-5">
            <div class="container">
                <div class="fs-3 fw-bold text-center">
                    <div class="fas fa-receipt"> 發票資訊</div>
                </div>
                <div class="row col-12 col-md-10 mx-auto">
                    <div class="form-text text-center mb-3">請選擇發票類型，公司行號及機構請記得填寫抬頭及統編</div>
                </div>
                <div class="container col-12 col-lg-9" id="receiptList">
                    <div class="row mx-auto text-center">
                        <div class="col">
                            <input class="form-check-input" id="receipt1" type="radio" name="receipt" value="DonationInvoices"
                                checked />
                            <label class="form-check-label" for="receipt1">捐贈慈善機構</label>
                        </div>
                        <div class="col">
                            <input class="form-check-input" id="receipt2" type="radio" name="receipt" value="DuplicateInvoices"
                                checked />
                            <label class="form-check-label" for="receipt2">二聯式發票</label>
                        </div>
                        <div class="col">
                            <input class="form-check-input" id="receipt3" type="radio" name="receipt" value="TriplicateInvoices"
                                checked />
                            <label class="form-check-label" for="receipt3">三聯式發票</label>
                        </div>
                    </div>
                    <div class="row col-8 mx-auto" id="tax">
                        <div class="row g-3 position-relative">
                            <div class="col-12 position-relative">
                                <label class="form-label" for="taxname"><span>抬頭</span><span class="small text-danger">
                                        (必填)</span></label>
                                <input class="form-control" id="taxname" name="taxname" type="text" value="" pattern=".+" required />
                                <div class="invalid-feedback">請輸入抬頭</div>
                            </div>
                            <div class="col-12 position-relative">
                                <label class="form-label" for="taxnumber"><span>統編</span><span class="small text-danger">
                                        (必填)</span></label>
                                <input class="form-control" id="taxnumber" name="taxnumber" type="text" value="" pattern="^[0-9]{8}$"
                                    required />
                                <div class="valid-feedback">輸入正確</div>
                                <div class="invalid-feedback">請輸入正確的統一編號</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="mx-2 my-4">
            <div class="row mt-4 justify-content-md-center mx-0">
                <div class="col d-md-none"></div>
                <div class="col-5 text-end col-md-auto"><a type="button" href="javascript:history.back();">
                        <button class="btn btn-secondary"><i class="fas fa-chevron-left">重新選擇</i></button></a></div>
                <div class="col-5 text-start col-md-auto">
                    <button class="btn btn-success" type="submit">
                        <div class="fas">確認送出 </div><i class="fas fa-chevron-right"></i>
                    </button>
                </div>
                <div class="col d-md-none"></div>
            </div>
        </section>
    </form>

<%-- 結束 --%>
<jsp:include page="../template/footer.html"></jsp:include>
<script src='https://cdn.bootcdn.net/ajax/libs/skrollr/0.6.30/skrollr.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js'></script>
<script src="../js/allPageJS.js"></script>

<%-- 此頁JS載入開始 --%>
<script src="../js/cart.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		restoreValue();
		var receiptChoose = $("input[name='receipt']:checked").val()
		if(receiptChoose != "TriplicateInvoices"){
		  $("#tax").slideUp(400);
		  $("#taxname").removeAttr("required");
		  $("#taxnumber").removeAttr("required");
		}
	});
	
	function restoreValue() {
		  $("#name").val($("#readname").val());
		  $("#phone").val($("#readphone").val());
		  $("#email").val($("#reademail").val());
		  $("#city").val($("#readcity").val());
		  $("#postcode").val($("#readpostcode").val());
		  $("#address").val($("#readaddress").val());
		  $("#name").val($("#readname").val());
	
		  $("form").removeClass("was-validated");
		  $("#users_id").removeClass("is-valid");
		  $("#users_id").removeClass("is-invalid");
	}
	

	
	//當非選擇【三聯式發票】
	$("#receipt1,#receipt2").click(
	  function(){
	    $("#tax").slideUp(400);
	    $("#taxname").removeAttr("required");
	    $("#taxnumber").removeAttr("required");
	  }
	)

	//當選擇【三聯式發票】
	$("#receipt3").click(
	  function(){
	    $("#tax").slideDown(400);
	    $("#taxname").attr("required","");
	    $("#taxnumber").attr("required","");
	  }
	)

	//移至特定ID
	function scrollTopPX(id){
	  $('html, body').animate({scrollTop: $(id).offset().top-parseInt($("#topnav").css("height"))-40}, 'normal', 'linear');
	}

	//讀取特定ID自己的pattern，判斷特定ID的值是否符合規則，符合true，不符合false
	function RETest(idname){
	  var RE = $(idname).attr("pattern");
	  if (RE == undefined){
	    RE = /.+/;
	  }
	  // alert(idname + "值: " + $(idname).val() + "\nRE: " + RE );
	  
	  if ($(idname).val() != null){
	    var matchVal = $(idname).val().match(RE);
	    if (matchVal == null){
	      // alert("RETest(" + idname + "): false");
	      return false;
	    }else{
	      // alert("RETest(" + idname + "): true");
	      return true;
	    }
	  }else{
	    return false;
	  }
	}

	//確認【三聯式發票】時要填寫抬頭統編
	function formcheck(){
	  if (!RETest("#name")){
	    scrollTopPX("#name")
	  }else if(!RETest("#phone")){
	    scrollTopPX("#phone");
	  }else if(!RETest("#email")){
	    scrollTopPX("#email");
	  }else if(!RETest("#city")){
	    scrollTopPX("#city");
	  }else if(!RETest("#postcode")){
	    scrollTopPX("#postcode");
	  }else if(!RETest("#address")){
	    scrollTopPX("#address");
	  }else{
	    var receiptChoose = $("input[name='receipt']:checked").val();
	    if(receiptChoose == "TriplicateInvoices"){
	      if (!RETest("#taxname")){
	        scrollTopPX("#taxname");
	      }else if(!RETest("#taxnumber")){
	        scrollTopPX("#taxnumber");
	      }else{
	        checkout();
	      }
	    }else{
	      checkout();
	    }
	  }
	  return false;
	}
	
    function checkout() {
		alertify.set({ labels: { ok: "確定", cancel: "取消" } });
	    alertify.confirm('確認送出？ <br/>按下確定後，請您稍待一會，謝謝您',
	        function (e) {
	            if (e) {
	            	$('#orderdetail').submit();
	            } else {
	                return false;
	            }
	        });
	}
	
    function updateNav(){
        $.ajax({
            type: "POST",
            url: "/magnetEC/template/nav.jsp",
            data: null,
            success: function (navdata) {
                $("#nav").html(navdata);
            }
        });
    }
</script>
<%-- 此頁JS載入結束 --%>

</body>
</html>