<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 判斷是否已經登入，已經登入過則跳過登入頁面，直接顯示登入成功
	if (service.UsersService.isLogin(request)) {
		// 跳轉至成功登入頁面
		response.sendRedirect("users_login_ok.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入 - 磁鐵超市</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="../css/users_login.css" type="text/css" />
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

<div class="header jumbotron"></div>
<!--左方導覽+右方會員登入-->
<section id="left_zone">
  <div class="container">
    <div class="row">
      <!--左方導覽-->
      <div class="col-3">
        <div class="list-group">        	
        	<a class="list-group-item list-group-item-action active" aria-current="true">會員專區</a>
        	<a class="list-group-item list-group-item-action" href="users_register.jsp">會員註冊</a>
        	<a class="list-group-item list-group-item-action list-group-item-info">會員登入</a>
        	<a class="list-group-item list-group-item-action d-none" href="users_edit.jsp">會員資料</a>
        	<a class="list-group-item list-group-item-action d-none" href="users_changepw.jsp">變更密碼</a>
        	<a class="list-group-item list-group-item-action d-none" href="users_queryorder">訂單查詢</a>
	        <a class="list-group-item list-group-item-action d-none" href="ogin.do?action=logout">會員登出</a>
        </div>
      </div>
      <!--右方部分:會員登入-->
      <div class="col-9 productDetail">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/magnetEC/index.jsp">首頁</a></li>
                  <li class="breadcrumb-item"><a href="">會員專區</a></li>
                  <li class="breadcrumb-item" aria-current="page">會員登入</li>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <!--會員登入-->
        <div class="row col-12 col-md-10 mx-auto">
          <div class="fs-3 fw-bold text-center">會員登入</div>
          <div class="form-text text-center mb-3">為了提供您更完善的服務，請登入會員，謝謝您。</div>
          <div class="container" id="loginpage">
            <div class="row col-8 col-lg-6 mx-auto">
              <form action="login.do?action=login" id="loginform" method="post">
                <div class="my-3 row gx-1">
                  <label class="fw-bold col-sm-2 col-form-label" for="inputID">帳號</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="inputID" name="inputID" type="text" placeholder="User ID"/>
                  </div>
                </div>
                <div class="my-3 row gx-1">
                  <label class="fw-bold col-sm-2 col-form-label" for="inputPassword">密碼</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="inputPassword" name="inputPassword" type="password" placeholder="Password"/>
                  </div>
                </div>
                <div class="row g-1 text-center">
                  <div class="col w-50">
                    <button class="btn btn-info" type="submit">　登入　</button>
                  </div>
                  <div class="col">
                    <button class="btn btn-warning" type="button" onclick="location.href='users_register.jsp'">　註冊　</button>
                  </div>
                </div>
              </form>
            </div>
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
<%-- <script src="js/users_register.js"></script> --%>
<%-- 此頁JS載入結束 --%>

</body>
</html>