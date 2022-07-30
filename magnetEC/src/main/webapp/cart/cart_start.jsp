<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="dao.ProductDaoImpl"
    import="model.Product"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<!--購物車流程一-->
<section class="mx-2 mt-3">
  <div class="row col-12">
    <!--層次結構導航-->
    <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
      <div class="col">
        <h5>
          <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item"><a href="#">磁鐵購買</a></li>
              <li class="breadcrumb-item active" aria-current="page">購物車</li>
            </ol>
          </nav>
        </h5>
      </div>
    </div>
  </div>
  <!--購物車流程一-->
  <div class="container row col-12 col-md-10 mx-auto mt-3">
    <div class="fs-2 fw-bold text-center">購物車</div>
    <div class="my-2 mx-auto">
      <div class="row col-9 col-lg-8 mx-auto">
        <div class="position-relative m-4">
          <div class="progress" style="height: 1px;">
            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
          <div class="row">
            <div class="col">
              <button class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill" type="button" style="width: 10rem; height:2.3rem;">01 / 運送付款方式</button>
            </div>
            <div class="col d-none d-sm-block">
              <button class="position-absolute top-0 translate-middle btn btn-sm btn-secondary rounded-pill" type="button" style="width: 10rem; height:2.3rem; left: 46%">02 / 填寫訂購資料</button>
            </div>
            <div class="col d-none d-sm-block">
              <button class="position-absolute top-0 translate-middle btn btn-sm btn-secondary rounded-pill" type="button" style="width: 10rem; height:2.3rem; left: 92%">03 / 完成訂購</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container-fluid row col-12 my-3 mx-0">
    <c:choose>
      <c:when test="${ShoppingCart.shoppingMapSize() == 0}">
          <div class="row col-12 my-2">
        	  <div class="text-center fs-5 fw-bold">
        		  您沒有選擇任何商品
        	  </div>
          </div>
      </c:when>
      <c:otherwise>
	    <div class="row col-12 col-sm-8 col-lg mt-5 mx-auto">
	      <form id="TransportPay" action="cart_checkout.jsp" method="POST">
		      <!--運送方式-->
		      <div class="fs-4">
		      	<i class="fas fa-truck"> 選擇運送方式</i>
		      </div>
		      <div class="fs-6 mx-3 my-2 d-grid gap-2" id="shippingmethod">
		        <div class="form-check">
		          <input class="form-check-input" id="delivery" type="radio" name="transportRadios" value="delivery" checked=""/>
		          <label class="form-check-label" for="delivery">宅配 - 酌收60元物流費，但滿千免運費</label>
		        </div>
		        <div class="form-check">
		          <input class="form-check-input" id="cashondelivery" type="radio" name="transportRadios" value="cashondelivery"/>
		          <label class="form-check-label" for="cashondelivery">貨到付款 - 酌收80元物流費，單筆消費滿1000元，只酌收處理費50元</label>
		        </div>
		        <div class="form-check">
		          <input class="form-check-input" id="pick711" type="radio" name="transportRadios" value="pick711" disabled=""/>
		          <label class="form-check-label" for="pick711">7-11純取貨（尚未開放）</label>
		        </div>
		        <div class="form-check">
		          <input class="form-check-input" id="pickpay711" type="radio" name="transportRadios" value="pickpay711" disabled=""/>
		          <label class="form-check-label" for="pickpay711">7-11取貨付款（尚未開放）</label>
		        </div>
		      </div>
		      <!--付款方式-->
		      <div class="row col mt-3">
		      	<div class="fs-4 mt-3 mb-2">
			      	<i class="fa-solid fa-money-bill-1-wave">
			      		<div class="fas"> 選擇付款方式</div>
			      	</i>
		      	</div>
		      </div>
		      <div class="fs-6 mx-3 d-grid gap-2" id="paymethod_delivery">
		        <div class="form-check">
		          <input class="form-check-input" id="remittance" type="radio" name="payRadios" value="remittance" checked="checked"/>
		          <label class="form-check-label" for="remittance">匯款</label>
		        </div>
		        <div class="form-check">
		          <input class="form-check-input" id="creditcard" type="radio" name="payRadios" value="creditcard"/>
		          <label class="form-check-label" for="creditcard">線上刷卡</label>
		        </div>
		      </div>
		      <div class="fs-6 mx-3 my-2 d-grid gap-2 d-none" id="paymethod_cashondelivery">
		        <div class="form-check">
		          <input class="form-check-input" id="payondelivery" type="radio" name="payRadios" value="payondelivery"/>
		          <label class="form-check-label" for="payondelivery">貨到付款</label>
		        </div>
		      </div>
		  </form>
	    </div>
	    <div class="row col-12 col-lg-8 mt-4 mx-auto px-0">
	      <div class="fs-4 mt-3 mb-2"><i class="fa-brands fa-product-hunt">
	          <div class="fas"> 購物車明細</div></i>
	        <div class="d-sm-none fs-6 text-danger fw-bold">(行動裝置可左右滑動明細)</div>
	      </div>
	      <div class="table-responsive">
	        <table class="table table-hover text-center" id="shoppingCartList">
	        	<%@ include file="../template/shoppingCartList.jsp" %>
	        </table>
	      </div>
	    </div>
      </c:otherwise>
    </c:choose>
    <div class="row mt-4 justify-content-md-center mx-0">
      <div class="col d-md-none"></div>
      <div class="col-5 text-end col-md-auto">
        <c:choose>
		      <c:when test="${ShoppingCart.shoppingMapSize() == 0}">
		        <a type="button" href="/magnetEC/product?magnetType=all">
		            <button class="btn btn-secondary"><i class="fas fa-chevron-left">瀏覽商品</i></button>
		        </a>
		      </c:when>
		      <c:otherwise>
		        <a type="button" href="javascript:history.back();">
				    <button class="btn btn-secondary"><i class="fas fa-chevron-left">繼續購物</i></button>
			    </a>
		      </c:otherwise>
		</c:choose>
      </div>
      <div class="col-5 text-start col-md-auto">
        <button class="btn btn-success" onclick="checkout()" <c:if test="${ShoppingCart.shoppingMapSize() == 0}">disabled="disabled"</c:if>>
          <div class="fas">進行結算 </div><i class="fas fa-chevron-right"></i>
        </button>
      </div>
      <div class="col d-md-none"></div>
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
<script src="../js/cart.js"></script>
<script type="text/javascript">

	//--依照運運送方式，顯示不同的付款方式 開始--
	//當選擇【宅配】
	$("#delivery").click(function () {
	    $("#paymethod_delivery").removeClass("d-none");
	    $("#paymethod_cashondelivery").addClass("d-none");
	
	    $("input[name='payRadios'][value='remittance']").prop('checked', true);

		var transportRadios = $("#delivery").val();
	    $.ajax({
			type: "POST",
			async : false,										//是否異步處理，預設值: true
			//cache: false,										//防止抓到快取的回應，預設值: true
			url: "../template/shoppingCartList.jsp",
			data: {
				"transport" : transportRadios
              },
            //contentType:"application/json ; charset=utf-8",		//要送到Server的資料型態	
			dataType: "html",									//預期從server接收的資料型態，預設值: 智慧選擇(自動根據HTTP的MIME資訊來智慧判斷)
			success: function(response) {
				$("#shoppingCartList").html(response);
			},
			error: function(xhr) {
				alert(xhr.status);
			}
		});
	})
	//當選擇【貨到付款】
	$("#cashondelivery").click(function () {
	    $("#paymethod_cashondelivery").removeClass("d-none");
	    $("#paymethod_delivery").addClass("d-none");
	
	    $("input[name='payRadios'][value='payondelivery']").prop('checked', true);

	    var transportRadios = $("#cashondelivery").val();
	    $.ajax({
			type: "POST",
			async : false,										//是否異步處理，預設值: true
			//cache: false,										//防止抓到快取的回應，預設值: true
			url: "../template/shoppingCartList.jsp",
			data: {
				"transport" : transportRadios
              },
            //contentType:"application/json ; charset=utf-8",		//要送到Server的資料型態	
			dataType: "html",									//預期從server接收的資料型態，預設值: 智慧選擇(自動根據HTTP的MIME資訊來智慧判斷)
			success: function(response) {
				$("#shoppingCartList").html(response);
			},
			error: function(xhr) {
				alert(xhr.status);
			}
		});
	})
	//--依照運運送方式，顯示不同的付款方式 結束--

	//移除項目
    function removeItemShoppingCart(num, productId , product_Name ){
        $.ajax({
            type: "POST",
            async : false ,
            url: "/magnetEC/template/ShoppingCart.jsp",
            data: {"productId":productId,"submit":"remove"},
            success: function result(data,status){
                $(".showlist").html(data);
            }
        });
        update_cart(num);
        alertify.success('成功移除 ' + product_Name);
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

    function checkout() {
		alertify.set({ labels: { ok: "確定", cancel: "取消" } });
	    alertify.confirm('確認送出？ <br/>按下確定後，請您稍待一會，謝謝您',
	        function (e) {
	            if (e) {
	                document.getElementById('TransportPay').submit();
	            } else {
	                return false;
	            }
	        });
	}
</script>
<%-- 此頁JS載入結束 --%>

</body>
</html>