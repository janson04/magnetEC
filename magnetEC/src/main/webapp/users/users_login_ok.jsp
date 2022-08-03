<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入成功 - 磁鐵超市</title>

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
<!--左方導覽+會員登入成功頁面-->
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
	        <a class="list-group-item list-group-item-action" href="users_queryorder">訂單查詢</a>
			<a class="list-group-item list-group-item-action" href="login.do?action=logout">會員登出</a>
        </div>
      </div>
      <!--右方部分:會員登入成功-->
      <div class="col-9 productDetail">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/magnetEC/index.jsp">首頁</a></li>
                  <li class="breadcrumb-item"><a href="#">會員專區</a></li>
                  <li class="breadcrumb-item active" aria-current="page">會員登入</li>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <!--會員登入成功-->
        <div class="row col-12 col-md-10 mx-auto">
          <div class="fs-3 fw-bold text-center">會員登入成功</div>
          <div class="form-text text-center mb-3">Login in successfully</div>
        </div>
        <hr/>
        <div class="container" id="loginok">
          <div class="fs-2 fw-bold text-center text-success">成功登入會員</div>
          <div class="fs-5 text-center">您可開始瀏覽選購商品，或查詢您的會員資訊。</div>
          <div class="text-center mt-3 mx-2">
            <button class="btn btn-sm btn-primary" onclick="window.location.href='/magnetEC/index.jsp'"><i class="fas fa-house"> 首頁</i></button>
            <button class="btn btn-sm btn-primary" onclick="window.location.href='product?magnetType=all'"><i class="fas fa-magnet"> 磁鐵購買</i></button>
            <button class="btn btn-sm btn-primary" onclick="window.location.href='/'"><i class="fas fa-magnifying-glass"> 訂單查詢</i></button>
          </div>
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
<%-- 此頁JS載入結束 --%>

</body>
</html>