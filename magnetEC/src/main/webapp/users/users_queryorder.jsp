<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	// 驗證機制 - 會員專屬畫面
	// 判斷是否已經登入，沒登入過跳轉至登入畫面
	if (! service.UsersService.isLogin(request)) {
		// 跳轉至登入頁面
		response.sendRedirect("users_login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢訂單 - 磁鐵超市</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="../css/users_register.css" type="text/css" />
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
<!--左方導覽+右方會員註冊-->
<section id="left_zone">
  <div class="container">
    <div class="row">
      <!--左方導覽-->
      <div class="col-3">
        <div class="list-group">
        	<a class="list-group-item list-group-item-action active" aria-current="true">會員專區</a>
	        <a class="list-group-item list-group-item-action d-none" href="users_register.jsp">會員註冊</a>
	        <a class="list-group-item list-group-item-action d-none" href="users_login.jsp">會員登入</a>
	        <a class="list-group-item list-group-item-action" href="users_edit.jsp">會員資料</a>
	        <a class="list-group-item list-group-item-action" href="users_changepw.jsp">變更密碼</a>
	        <a class="list-group-item list-group-item-action list-group-item-info">訂單查詢</a>
			<a class="list-group-item list-group-item-action" href="login.do?action=logout">會員登出</a>
        </div>
      </div>
      <!--右方部分:秀出該ID全部訂單-->
      <div class="col-9 productDetail px-0 px-md-3">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/magnetEC/index.jsp">首頁</a></li>
                  <li class="breadcrumb-item"><a href="#">會員專區</a></li>
                  <li class="breadcrumb-item active" aria-current="page">訂單查詢</li>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <!--訂單查詢-->
        <div class="row col-12 col-md-10 mx-auto">
          <div class="fs-3 fw-bold text-center">訂單查詢</div>
          <div class="form-text text-center mb-3 fs-6">此處顯示 帳號： ${ user.users_id } 的所有歷史訂單。</div>
        </div>
        <div class="container px-0 px-md-3">
        <c:choose>
			<c:when test="${requestScope.CorderLists.size() == null}">
		        <div class="fs-5 text-center">您尚未擁有任何訂單，請瀏覽商品並下單<br/>您將會在此處看見您的訂單</div>
		    </c:when>
        	<c:otherwise>
        		<c:forEach items="${requestScope.CorderLists}" var="Corder" varStatus="status">
	              <div class="accordion-item table-responsive" style="background-color: rgba(255,255,255,0);">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed px-0 px-md-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.count}" aria-expanded="false" aria-controls="collapseTwo" style="background-color: rgba(255,255,255,100%);">
				        <table class="table table-hover mb-0 table-borderless" id="CorderList">
				        	<tr>
				              <td>訂單號碼: ${Corder.corder_id}</td>
				              <td>日期: ${Corder.create_date}</td>
				              <td style="width: 170px;">總金額: <fmt:formatNumber type="number" pattern="$#,###">${Corder.sum}</fmt:formatNumber></td>
				            </tr>
				        </table>
				      </button>
				    </h2>
				    <div id="collapse${status.count}" class="accordion-collapse collapse" aria-labelledby="collapse${status.count}" data-bs-parent="#accordionExample">
				      	<table class="table table-hover mb-0 table-secondary" id="CorderList" style="background-color: rgba(255,255,255,0.8);">
				      		<tr>
				      		  <td></td>
				      		  <td></td>
				      		  <td></td>
				      		  <td></td>
				      		  <td></td>
				      		</tr>
				      		<tr class="text-center">
				              <td colspan="2" style="min-width: 100px;">配送方式： ${Corder.shippingmethod}</td>
				              <!-- ${pageScope.shippingmethod = Corder.shippingmethod} -->
				              <td colspan="2">付款方式： ${Corder.paymethod}</td>
				              <td colspan="1">發票方式： ${Corder.receipt}</td>
				            </tr>
				            <c:if test="${Corder.receipt == '三聯式發票' || Corder.receipt == 'TriplicateInvoices'}">
				            <tr>
				              <td colspan="3" class="text-center">抬頭： ${Corder.taxname}</td>
				              <td colspan="2" class="text-center">統編： ${Corder.taxnumber}</td>
				            </tr>
				            </c:if>
				            <tr>
				              <td colspan="1" class="text-center">姓名：</td>
				              <td colspan="4">${Corder.cname}</td>
				            </tr>
				            <tr>
				              <td colspan="1" class="text-center">手機：</td>
				              <td colspan="4">${Corder.phone}</td>
				            </tr>
				            <tr>
				              <td colspan="1" class="text-center">地址：</td>
				              <td colspan="4">${Corder.postcode} ${Corder.city}${Corder.address}</td>
				            </tr>
				            <tr>
				              <td colspan="1" class="text-center">備註：</td>
				              <td colspan="4" style="max-width: 500px; overflow-wrap: break-word;">${Corder.notes}</td>
				            </tr>
				        </table>
				        <table class="table table-hover text-center table-secondary" id="CorderList">
				          <thead class="table-default" style="background-color: rgba(255,255,255,0.8);">
				            <tr class="fw-bold">
				              <td>商品編號</td>
				              <td>商品名稱</td>
				              <td>數量</td>
				              <td>單價</td>
				              <td>小計</td>
				            </tr>
				          </thead>
				          <c:set value="${Corder.codlist}" var="codl"/>
				          <tbody style="background-color: rgba(255,255,255,0.8);">
				          	<!-- ${pageScope.subtotal = 0} -->
				          	<c:forEach items="${codl}" var="Corder_detail" varStatus="detailstatus">
								<tr>
									<td><span id="product_Id${ detailstatus.count }">${ Corder_detail.product_Id }</span></td>
									<td>${ Corder_detail.product_Name }</td>
									<td class="numwidth">
									  <div class="row">
									    <div class="col mx-auto">
								          <div id="stock1">${ Corder_detail.single_buynum }</div>
									    </div>
									  </div>
									</td>
									<td>NT$ <span id="product_price${ detailstatus.count }">${ Corder_detail.product_price }</span></td>
									<td>NT$ <span id="subtotal${ detailstatus.count }">${ Corder_detail.product_price * Corder_detail.single_buynum }</span></td>
									<!-- ${pageScope.subtotal = pageScope.subtotal + Corder_detail.product_price * Corder_detail.single_buynum } -->
								</tr>
							</c:forEach>
				          </tbody>
				          <tfoot class="fw-bold" style="background-color: rgba(255,255,255,0.8);">
				            <tr>
				              <td id="Products_Total" class="text-end" colspan="4">商品金額總計</td>
			                  <td colspan="2">NT$ <span id="subtotal_sum">${pageScope.subtotal}</span></td>
				            </tr>
					        <tr>
					          	<td class="text-end" colspan="4">運費</td>
					            <%			        	
						            String transport = (String) pageContext.getAttribute("shippingmethod");
	
						            long subtotal = 0;
						            if ( pageContext.findAttribute("subtotal") != null) {
						                subtotal = (long) pageContext.findAttribute("subtotal");
						            }
						        	
						        	//帶入運費方式及商品總金額，回傳運費
						        	int transportfee = service.ShoppingCartService.transportfee(transport, subtotal);
						       		pageContext.setAttribute("transportfee", transportfee);
							        
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
		      </c:forEach>
        	</c:otherwise>
        </c:choose>
			</div>
	        <div class="row mt-3 text-center mx-auto">
		      <div class="d-none d-md-block col"></div>
	          <div class="col-4 col-md-3">
	            <a type="button" href="javascript:history.back();">
	              <button class="btn btn-secondary"><i class="fas fa-chevron-left"></i> 回上一頁</button>
	            </a>
	          </div>
	          <div class="col-4 col-md-3">
	            <a type="button" onclick="CollapseOrder()">
	              <button class="btn btn-secondary"><i class="fas fa-folder-closed"></i> 收起訂單</button>
	            </a>
	          </div>
	          <div class="col-4 col-md-3">
	          	<a type="button" href="/magnetEC/product?magnetType=all">
	            	<button class="btn btn-primary"><i class="fas fa-magnet"></i>&nbsp;繼續購物</button>
	            </a>
	          </div>
         	  <div class="d-none d-md-block col"></div>
	        </div>
        </div>
      </div>
    </div>
</section>

<%-- 結束 --%>
<jsp:include page="../template/footer.html"></jsp:include>
<script src='https://cdn.bootcdn.net/ajax/libs/skrollr/0.6.30/skrollr.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js'></script>
<script src="../js/allPageJS.js"></script>

<%-- 此頁JS載入開始 --%>
<script src="../js/users_register.js"></script>
<script type="text/javascript">
	function CollapseOrder() {
		$("div.show").each(function(){
				//alert(this.id);
				var id = this.id;
				var $target = $("button[data-bs-target='#" + id + "']");
				$target.addClass("collapsed");
				$target.attr("aria-expanded","false");
			}
		);
		$("div.show").removeClass("show");
	}
</script>
<%-- 此頁JS載入結束 --%>

</body>
</html>