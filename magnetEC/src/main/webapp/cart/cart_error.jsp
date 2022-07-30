<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車錯誤 - 磁鐵超市</title>

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
                            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="50"
                                aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <button
                                    class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-secondary rounded-pill"
                                    type="button" style="width: 10rem; height:2.3rem;">01 / 運送付款方式</button>
                            </div>
                            <div class="col">
                                <button
                                    class="position-absolute top-0 translate-middle btn btn-sm btn-secondary rounded-pill"
                                    type="button" style="width: 10rem; height:2.3rem; left: 46%">02 / 填寫訂購資料</button>
                            </div>
                            <div class="col">
                                <button class="position-absolute top-0 translate-middle btn btn-sm btn-secondary rounded-pill"
                                    type="button" style="width: 10rem; height:2.3rem; left: 92%">03 / 完成訂購</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--完成訂購資訊-->
    <section class="mx-2 my-4">
        <div class="container">
            <div class="fs-3 fw-bold text-center">
                <div class="fas fa-clipboard-list text-danger"> 訂單錯誤</div>
            </div>
            <div class="row col-12 col-md-10 mx-auto">
                <div class="text-center mb-3 fs-5 text-danger">
                	感謝您進入本網站的結帳畫面，但發現了未知的錯誤<br/>
                	🙇‍♂請再重新結帳一次，造成不便敬請見諒🙇‍♀
                </div>
            </div>
        </div>
    </section>
    <div class="container">
        <div class="text-center my-3 mx-2">
            <button class="btn btn-sm btn-primary" onclick="window.location.href='/magnetEC/index.jsp'"><i class="fas fa-house">
                    首頁</i></button>
            <button class="btn btn-sm btn-primary" onclick="window.location.href='/magnetEC/product?magnetType=all'"><i class="fas fa-magnet">
                    繼續瀏覽磁鐵</i></button>
            <button class="btn btn-sm btn-success" onclick="window.location.href='cart_start.jsp'"><i class="fas fa-shopping-cart">
                    重新結帳</i></button>
        </div>
    </div>

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
		if(receiptChoose != "receipt3"){
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
	    if(receiptChoose == "receipt3"){
	      if (!RETest("#taxname")){
	        scrollTopPX("#taxname");
	      }else if(!RETest("#taxnumber")){
	        scrollTopPX("#taxnumber");
	      }else{
	        alertify.set({'labels':{'ok':"確定",'cancel':"取消"}});
	        alertify.confirm('確認送出? \n\r按下確定後,請您稍待一會,謝謝您。', 
	          function (e) {
	            if (e) {
	                $('#orderdetail').submit();
	            } else {
	                return false;
	            }
	        });
	      }
	    }else{
	      alertify.set({'labels':{'ok':"確定",'cancel':"取消"}});
	      alertify.confirm('確認送出? \n\r按下確定後,請您稍待一會,謝謝您。', 
	        function (e) {
	          if (e) {
	        	  $('#orderdetail').submit();
	          } else {
	              return false;
	          }
	      });
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