<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // 驗證機制 - 會員專屬畫面
	// 判斷是否已經登入，沒登入過跳轉至登入畫面
	if (session.getAttribute("user") == null) {
		// 跳轉至登入頁面
		response.sendRedirect("users_login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料 - 磁鐵超市</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="css/users_register.css" type="text/css" />
<%-- 此頁CSS載入結束 --%>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.core.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.default.min.css'>
<link rel="stylesheet" href="css/navfooter.css" type="text/css" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
</head>
<body>
<jsp:include page="template/nav.jsp"></jsp:include>
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
	        <a class="list-group-item list-group-item-action d-none" href="">會員註冊</a>
	        <a class="list-group-item list-group-item-action d-none" href="">會員登入</a>
	        <a class="list-group-item list-group-item-action list-group-item-info" href="">會員資料</a>
	        <a class="list-group-item list-group-item-action" href="">修改密碼</a>
	        <a class="list-group-item list-group-item-action" href="">訂單查詢</a>
			<a class="list-group-item list-group-item-action" href="login.do?action=logout">會員登出</a>
        </div>
      </div>
      <!--右方部分:會員資料修改-->
      <div class="col-9 productDetail">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.jsp">首頁</a></li>
                  <li class="breadcrumb-item"><a href="#">會員專區</a></li>
                  <li class="breadcrumb-item active" aria-current="page">會員資料</li>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <!--會員資料-->
        <div class="row col-12 col-md-10 mx-auto">
          <div class="fs-3 fw-bold text-center">個人資料修改</div>
          <div class="form-text text-center mb-3">為了提供您更完善的服務，請務必輸入正確的資料，謝謝您。</div>
        </div>
        <div class="container" id="registerpage">
          <form class="row g-3 position-relative needs-validation" action="users_update" method="post" novalidate="">
            <div class="col-lg-4 position-relative">
              <div class="row">
                <label class="form-label" for="users_id"><span>帳號</span></label>
                <div class="input-group has-validation"><span class="input-group-text">@</span>
                  <input class="form-control" id="users_id" name="users_id" type="text" aria-describedby="帳號" value="${sessionScope.user.users_id}" readonly/>
                  <div class="invalid-feedback">未輸入或發現重複的帳號</div>
                </div>
              </div>
            </div>
            <!--  
            <div class="col-lg-4 position-relative d-none">
              <label class="form-label" for="users_password"><span>密碼</span><span class="small text-danger"> (必填)</span></label>
              <input class="form-control" id="users_password" name="users_password" type="password" value="" placeholder="8碼英文+數字" pattern="^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$" required=""/>
              <div class="invalid-feedback">密碼需英文+數字，且至少八碼以上</div>
            </div>
            <div class="col-lg-4 position-relative d-none">
              <label class="form-label" for="checkpassword"><span>確認密碼</span><span class="small text-danger"> (必填)</span></label>
              <input class="form-control" id="checkpassword" name="checkpassword" type="password" pattern="^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$" required=""/>
              <div class="valid-feedback" id="valid-checkpassword">確認成功</div>
              <div class="invalid-feedback">確認密碼不符，請重新輸入</div>
            </div>
            -->
            <div class="col-lg-3 position-relative">
              <input id="readname" type="hidden" value="${sessionScope.user.name}"/>
              <label class="form-label" for="name"><span>姓名</span><span class="small text-danger"> (必填)</span></label>
              <input class="form-control" id="name" name="name" type="text" required=""/>
              <div class="invalid-feedback">請輸入姓名</div>
            </div>
            <div class="col-lg-4 position-relative">
              <input id="readphone" type="hidden" value="${sessionScope.user.phone}"/>
              <label class="form-label" for="phone"><span>手機</span><span class="small text-danger"> (必填)</span></label>
              <input class="form-control" id="phone" name="phone" type="text" pattern="^[0][9][0-9]{8}$" required=""/>
              <div class="valid-feedback">輸入正確</div>
              <div class="invalid-feedback">請輸入正確的手機號碼</div>
            </div>
            <div class="col-lg-5 position-relative">
              <input id="reademail" type="hidden" value="${sessionScope.user.email}"/>
              <label class="form-label" for="email">Email</label>
              <input class="form-control" id="email" name="email" type="email" value="${sessionScope.user.email}"/>
              <div class="valid-feedback">輸入正確</div>
              <div class="invalid-feedback">請輸入正確的Email</div>
            </div>
            <div class="col-lg-3 position-relative">
              <input id="readcity" type="hidden" name="readcity" value="${sessionScope.user.city}"/>
              <label class="form-label" for="city">縣市</label>
              <select class="form-select" id="city" name="city" aria-describedby="請選擇縣市">
                <option disabled="">請選擇</option>
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
              <input id="readpostcode" type="hidden" value="${sessionScope.user.postcode}"/>
              <label class="form-label" for="postcode">郵遞區號</label>
              <input class="form-control" id="postcode" name="postcode" value="${sessionScope.user.postcode}" type="tel" aria-describedby="請輸入郵遞區號" pattern="[0-9]{3,6}"/>
              <div class="invalid-feedback">請輸入正確的郵遞區號</div>
            </div>
            <div class="col-lg-6 position-relative">
              <input id="readaddress" type="hidden" value="${sessionScope.user.address}"/>
              <label class="form-label" for="address">送貨地址</label>
              <input class="form-control" id="address" name="address" value="${sessionScope.user.address}" type="text" aria-describedby="請輸入送貨地址"/>
              <div class="invalid-feedback" id="validationServer03Feedback">請輸入正確的地址</div>
            </div>
            <!--  
            <div class="col-12 position-relative">
              <div class="form-check">
                <input class="form-check-input" id="invalidCheck8" type="checkbox" value="" aria-describedby="閱讀並同意本網站條款和條件並打勾" required="required"/>
                <label class="form-check-label" for="invalidCheck8">已詳細閱讀並同意本網站條款和條件</label>
                <div class="invalid-feedback" id="invalidCheck8Feedback">您必須勾選才能進行下一步</div>
              </div>
            </div>
            -->
            <div class="row mt-3 text-center">
              <div class="col"></div>
              <div class="col-3">
                <button class="btn btn-secondary" type="button" onclick="restoreValue()">恢復資料</button>
              </div>
              <div class="col-3">
                <button class="btn btn-primary" type="submit">更新資料</button>
              </div>
              <div class="col"></div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<%-- 結束 --%>
<jsp:include page="template/footer.html"></jsp:include>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
<script src='https://cdn.bootcdn.net/ajax/libs/skrollr/0.6.30/skrollr.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js'></script>
<script src="js/allPageJS.js"></script>

<%-- 此頁JS載入開始 --%>
<script src="js/users_register.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		restoreValue();
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
</script>
<%-- 此頁JS載入結束 --%>

</body>
</html>