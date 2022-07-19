<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="service.ShoppingCartService"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 判斷是否已經登入，沒有的話讀取Cookie判斷是否已經登入
	service.UsersService.isLogin(request);
%>
<!--上方導覽列20220618:開始 -->
<nav class="navbar navbar-expand-md navbar-light bg-light fixed-top" id="topnav">
  <div class="container-fluid"><a class="navbar-brand" href="/magnetEC/index.jsp"><img src="https://www.msmt.com.tw/images/common/logo.png" alt=""/></a>
    <div class="collapse navbar-collapse mx-3" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/magnetEC/index.jsp">首頁</a></li>
        <li class="nav-item"><a class="nav-link" href="/magnetEC/index.jsp#story">磁鐵歷史</a></li>
        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">磁鐵介紹</a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/magnetEC/index.jsp#ND">燒結釹鐵硼</a></li>
            <li><a class="dropdown-item" href="/magnetEC/iindex.jsp#FE">鐵氧體磁鐵</a></li>
            <li><a class="dropdown-item" href="/magnetEC/iindex.jsp#RM">軟性橡膠磁鐵</a></li>
            <li><a class="dropdown-item" href="/magnetEC/iindex.jsp#SM">釤鈷磁鐵</a></li>
            <li><a class="dropdown-item" href="/magnetEC/iindex.jsp#AL">鋁鎳鈷磁鐵</a></li>
            <li><a class="dropdown-item" href="/magnetEC/iindex.jsp#PM">塑膠磁鐵</a></li>
            <li><a class="dropdown-item" href="/magnetEC/iindex.jsp#MQ">黏結釹鐵硼</a></li>
          </ul>
          <li class="nav-item"><a class="nav-link" href="/magnetEC/product?magnetType=all">磁鐵購買</a></li>
        </li>
      </ul>
      <!--搜尋欄-->
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="搜尋" aria-label="Search"/>
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div><span class="me-auto"></span>
    <!--會員按鈕:開始-->
    <c:choose>
	   	<c:when test="${empty sessionScope.ssid}">
    		<button class="btn btn-md btn-info my-2" id="users" type="button" data-bs-placement="bottom" data-bs-toggle="modal" data-bs-target="#login"><i class="fas fa-user"> 會 員</i></button>
	   	</c:when>
	   	<c:otherwise>
	   		<button class="btn btn-md btn-info my-2" id="users" type="button" data-bs-placement="bottom" data-bs-toggle="modal" onclick="location.href='/magnetEC/users/users_edit.jsp';"><i class="fas fa-user"> 會 員</i></button>
	   	</c:otherwise>
    </c:choose>
    <!--會員按鈕:結束-->
    <!--結帳按鈕-->
    <c:choose>
    	<c:when test="${empty sessionScope.ssid}">
		    <button class="btn btn-md btn-danger my-2" id="checkout" type="button" data-bs-placement="bottom" title="點擊結帳" data-bs-toggle="modal" data-bs-target="#checkoutPage" aria-hidden="true">
		    <i class="fas fa-shopping-cart"><span> 結 帳 </span><span>${ShoppingCart.shoppingMapSize()}</span></i></button>
		</c:when>
	   	<c:otherwise>
	   		<button class="btn btn-md btn-danger my-2" id="checkout" type="button" data-bs-placement="bottom" title="點擊結帳" data-bs-toggle="modal" onclick="location.href='/magnetEC/checkout';" aria-hidden="true">
		    <i class="fas fa-shopping-cart"><span> 結 帳 </span><span>${ShoppingCart.shoppingMapSize()}</span></i></button>
	   	</c:otherwise>
    </c:choose>
    <!--購買清單(浮動)-->
    <div class="showlist modal-body" style="min-width: 350px">
      
      <%-- <jsp:include page="ShoppingCart.jsp"></jsp:include> --%>
      <%@ include file="ShoppingCart.jsp" %> <%-- 先包再執行 --%>
      <!-- 
      <div class="modal-content">
        <div class="modal-body">
          <div class="container">
            <div class="row">
              <div class="col-4"><img src="https://www.msmt.com.tw/upload/2019092017015367wyv1.jpg" alt="" height="80px"/></div>
              <div class="col-8">
                <div class="row name">D5x2mmT-燒結釹鐵硼磁鐵</div>
                <div class="row qty">數量  : 3</div>
              </div>
            </div>
            <div class="row">
              <div class="col-4"><img src="https://www.msmt.com.tw/upload/201910141441278ojuq1.jpg" alt="" height="80px"/></div>
              <div class="col-8">
                <div class="row name">D6x12mmT-燒結釹鐵硼磁鐵</div>
                <div class="row qty">NT$ 19</div>
              </div>
            </div>
          </div>
          <hr/>
          <div class="row col">
            <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#checkoutPage">結帳</button>
          </div>
        </div>
      </div>
      -->
      
    </div>
  </div>
</nav>
<!-- 上方導覽列20220618:結束 -->
<!--登入頁面 20220605更新-->
<div class="modal fade" id="login">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <!--20220605-->
        <h5 class="modal-title" id="exampleModalLabel">會員登入</h5>
        <button id="closeloginform1" class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="loginform1" action="/magnetEC/users/login.do?action=login" method="post">
          <div class="mb-3">
            <label class="col-form-label" for="recipient-name">帳號</label>
            <input class="form-control" id="recipient-name" type="text" name="inputID"/>
          </div>
          <div class="mb-3">
            <label class="col-form-label" for="message-text">密碼</label>
            <input class="form-control" id="message-text" type="password" name="inputPassword"/>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-info" type="submit" form="loginform1">登入</button>
        <button class="btn btn-warning" type="button" onclick="location.href='/magnetEC/users/users_register.jsp';">註冊</button>
        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">關閉</button>
      </div>
    </div>
  </div>
</div>
<!--登入+非會員購買頁面 20220605-->
<div class="modal fade" id="checkoutPage">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">結帳</h5>
        <button id="closeloginform2" class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="fs-5 fw-bold mb-2">會員登入</div>
        <div class="row col">
          <form id="loginform2" action="/magnetEC/users/login.do?action=login" method="post">
            <div class="mb-3">
              <label class="col-form-label" for="recipient-name">帳號</label>
              <input class="form-control" id="recipient-name" type="text" name="inputID"/>
            </div>
            <div class="mb-3">
              <label class="col-form-label" for="message-text">密碼</label>
              <input class="form-control" id="message-text" type="password" name="inputPassword"/>
            </div>
            <div class="mb-3 text-center">
              <button class="btn btn-info" type="submit" form="loginform2">登入</button>
              <button class="btn btn-warning" type="button" onclick="location.href='/magnetEC/users/users_register.jsp';">註冊</button>
            </div>
          </form>
        </div>
        <hr/>
        <div class="fs-5 fw-bold mb-2">非會員購買</div>
        <div class="row col-6 mx-auto">
          <button class="btn btn-success">非會員直接購買</button>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
//滑鼠移進#checkout執行
$("#checkout").mouseenter(
    function () {
        $(".showlist").css("top", parseInt($("#topnav").css("height")) - 25 + "px");
        $(".showlist").slideDown(400);
    }
)


//滑鼠移出.showlist執行
$(".showlist").mouseleave(
    function () {
        $(".showlist").slideUp(400);
    }
)

//除了點選 .showlist 不然都把 .showlist收起來
$("nav,section,.header,footer").click(function () {
    $(".showlist").slideUp(300);
}
)

</script>