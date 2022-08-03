<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>磁鐵購買 - 磁鐵超市</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="css/product.css" type="text/css" />
<%-- 此頁CSS載入結束 --%>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.core.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.default.min.css'>
<link rel="stylesheet" href="css/navfooter.css" type="text/css" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
</head>
<body>
<div id="nav">
	<jsp:include page="template/nav.jsp"></jsp:include>
</div>
<%-- 開始 --%>

<div class="header jumbotron" style="margin-top: 70px;"></div>
<!--左方導覽+右方商品列表-->
<section id="magnet_buytype">
  <div class="container">
    <div class="row">
      <!--左方導覽-->
      <div class="col-3">
        <div class="list-group">
        	<a class="list-group-item list-group-item-action active" aria-current="true">磁鐵購買</a>
        	<a class="list-group-item list-group-item-action<c:if test="${param.magnetType=='ND'}"> list-group-item-info</c:if>" href="product?magnetType=ND&page=1">1.燒結釹鐵硼</a>
        	<a class="list-group-item list-group-item-action<c:if test="${param.magnetType=='FE'}"> list-group-item-info</c:if>" href="product?magnetType=FE&page=1">2.鐵氧體磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${param.magnetType=='RM'}"> list-group-item-info</c:if>" href="product?magnetType=RM&page=1">3.軟性橡膠磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${param.magnetType=='SM'}"> list-group-item-info</c:if>" href="product?magnetType=SM&page=1">4.釤鈷磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${param.magnetType=='AL'}"> list-group-item-info</c:if>" href="product?magnetType=AL&page=1">5.鋁鎳鈷磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${param.magnetType=='PM'}"> list-group-item-info</c:if>" href="product?magnetType=PM&page=1">6.塑膠磁鐵</a>
        	<a class="list-group-item list-group-item-action disabled" href="product?magnetType=MQ&page=1">7.黏結釹鐵硼<br />　(尚未開賣)</a>
        </div>
      </div>
      <!--右方商品列表-->
      <div class="col-9">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.jsp">首頁</a></li>
                  <c:choose>
                  	<c:when test="${param.magnetType == 'all'}">
                  		<li class="breadcrumb-item active" aria-current="page">磁鐵購買</li>
                  	</c:when>
                  	<c:otherwise>
                  		<li class="breadcrumb-item" aria-current="page"><a href="product?magnetType=all">磁鐵購買</a></li>
                  		<li class="breadcrumb-item active" aria-current="page">${magnetTypeFullName}</li>
                  	</c:otherwise>
                  </c:choose>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
          <c:forEach items="${ magnetShowList }" var="product" begin="${(page-1) * 8 + 0 }" end="${(page-1) * 8 +7 }">
	          <div class="col"><a href="products_detail?id=${product.productId }"> 
	              <div class="card">
	              	<img class="card-img-top" src="${product.imgurl}" alt="..."/>
	                <div class="card-body">
	                  <h5 class="card-title">${ product.productName }</h5>
	                  <p class="card-text">NT$ ${ product.price }</p>
	                </div>
	              </div></a>
	          </div>
          </c:forEach>
        </div>
        <div class="row">
          <div class="col-12 pageSelection">
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center" style="min-width: 350px;">
                <c:if test="${page>1}"><li class="page-item"><a class="page-link" href="product?magnetType=${ param.magnetType }&page=${ page-1 }" aria-label="Previous"><span aria-hidden="true">«</span></a></li></c:if>
                <c:forEach var="p" begin="1" end="${magnetShowMaxPage}">
                	<li class="page-item"><a class="page-link" href="product?magnetType=${ param.magnetType }&page=${ p }">${ p }</a></li>
                </c:forEach>
                <c:if test="${page<magnetShowMaxPage}"><li class="page-item"><a class="page-link" href="product?magnetType=${ param.magnetType }&page=${ page+1 }" aria-label="Next"><span aria-hidden="true">»</span></a></li></c:if>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%-- 結束 --%>
<jsp:include page="template/footer.html"></jsp:include>
<script src='https://cdn.bootcdn.net/ajax/libs/skrollr/0.6.30/skrollr.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js'></script>
<script src="js/allPageJS.js"></script>

<%-- 此頁JS載入開始 --%>
<script src="js/product.js"></script>
<%-- 此頁JS載入結束 --%>

</body>
</html>