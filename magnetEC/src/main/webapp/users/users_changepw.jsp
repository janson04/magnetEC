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
<title>變更密碼 - 磁鐵超市</title>

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
	        <a class="list-group-item list-group-item-action list-group-item-info">變更密碼</a>
	        <a class="list-group-item list-group-item-action" href="users_queryorder">訂單查詢</a>
			<a class="list-group-item list-group-item-action" href="login.do?action=logout">會員登出</a>
        </div>
      </div>
      <!--右方部分:變更密碼-->
      <div class="col-9 productDetail">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/magnetEC/index.jsp">首頁</a></li>
                  <li class="breadcrumb-item"><a href="#">會員專區</a></li>
                  <li class="breadcrumb-item active" aria-current="page">變更密碼</li>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <!--會員密碼變更-->
        <div class="row col-12 col-md-10 mx-auto">
          <div class="fs-3 fw-bold text-center">變更密碼</div>
          <div class="form-text text-center mb-3">請輸入舊密碼驗證，即可變更密碼。</div>
        </div>
        <div class="container mainarea">
          <form class="row g-3 position-relative needs-validation" action="users_update?action=changepw" method="post" onsubmit="return formcheck2()" novalidate="">
            <div class="col-lg-6 position-relative">
              <div class="row">
                <label class="form-label" for="users_id"><span>帳號</span></label>
                <div class="input-group has-validation"><span class="input-group-text">@</span>
                  <input class="form-control formCheckDefault" id="users_id" name="users_id" type="text" aria-describedby="帳號" value="${sessionScope.user.users_id}" readonly/>
                  <div class="invalid-feedback">未輸入或發現重複的帳號</div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 position-relative">
              <label class="form-label" for="old_users_password"><span>舊密碼</span><span class="small text-danger"> (必填)</span></label>
              <input class="form-control formCheckDefault" id="old_users_password" name="old_users_password" type="password" value="" placeholder="請輸入舊密碼" required=""/>
              <div class="valid-feedback" id="valid-checkpassword">密碼正確</div>
              <div class="invalid-feedback">未輸入或密碼錯誤</div>
            </div>
            <div class="col-lg-6 position-relative">
              <label class="form-label" for="users_password"><span>新密碼</span><span class="small text-danger"> (必填)</span></label>
              <input class="form-control" id="users_password" name="users_password" type="password" value="" placeholder="8碼英文+數字" pattern="^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$" required=""/>
              <div class="invalid-feedback">密碼需英文+數字，且至少八碼以上</div>
            </div>
            <div class="col-lg-6 position-relative">
              <label class="form-label" for="checkpassword"><span>確認密碼</span><span class="small text-danger"> (必填)</span></label>
              <input class="form-control" id="checkpassword" name="checkpassword" type="password" pattern="^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$" required=""/>
              <div class="valid-feedback" id="valid-checkpassword">確認成功</div>
              <div class="invalid-feedback">確認密碼不符，請重新輸入</div>
            </div>
            <div class="row mt-3 text-center">
              <div class="col"></div>
              <div class="col-3">
                <button class="btn btn-secondary" type="button" onclick="restoreValue()">恢復資料</button>
              </div>
              <div class="col-3">
                <button class="btn btn-primary" type="submit">變更密碼</button>
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
<jsp:include page="../template/footer.html"></jsp:include>
<script src='https://cdn.bootcdn.net/ajax/libs/skrollr/0.6.30/skrollr.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js'></script>
<script src="../js/allPageJS.js"></script>

<%-- 此頁JS載入開始 --%>
<script src="../js/users_register.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		restoreValue();
	});

	function restoreValue() {
		$("#old_users_password").val('');
		$("#users_password").val('');
		$("#checkpassword").val('');
		
		$("form").removeClass("was-validated");
		UnCheckCSS("#users_id");
		UnCheckCSS("#old_users_password");
	}

	//按任何按鍵，就恢復初始值不要驗證
	$("#old_users_password").keyup(function checkUsersId(){
		UnCheckCSS("#old_users_password");
	});
	
	$("#checkpassword,#users_password").keyup(function checkUsersId(){
		var users_password = $("#users_password").val();
		var checkpassword = $("#checkpassword").val();
		
		if (checkpassword.length>0){
			if((users_password == checkpassword)){
				ValidCSS("#checkpassword");
			}else{
				InvalidCSS("#checkpassword");
			}
		}else{
			UnCheckCSS("#checkpassword");
		}
	});
	
	function formcheck2(){
		var old_users_password = $("#old_users_password").val();
		var users_password = $("#users_password").val();
		var checkpassword = $("#checkpassword").val();
		var send = false;

		$.ajax({
			  type: 'POST',
			  async: false,
			  url: "../rest/checkOldPassword",
			  data: {"old_users_password": old_users_password},
			  success: 
				  function(data,status){
					//alert(data);
				    if(data == "true"){
					    //舊密碼正確
						if($("#old_users_password").val().length>0){
							ValidCSS("#old_users_password");
						}
		
						if(users_password.length > 0){
							if (users_password == checkpassword){
								send = true;
							}else{
								alertify.error("新密碼兩次不相同，請重新輸入");
								send = false;
							}
						}else{
							alertify.error("新密碼不能為空");
							send = false;
						}
					}else{
						//舊密碼錯誤
				    	alertify.error("舊密碼錯誤，請確認是否正確");
				    	InvalidCSS("#old_users_password");
				    	send = false;				
					}
				}
			});

		//alert(send);
		if (send == true){
			return true;
		}else{
			return false;
		}
	}
</script>
<%-- 此頁JS載入結束 --%>

</body>
</html>