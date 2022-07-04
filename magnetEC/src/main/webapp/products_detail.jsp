<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${showProduct.productName} - 磁鐵超市</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="css/product_detail.css" type="text/css" />
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
<!--左方導覽+右方商品詳細資訊-->
<section id="magnet_buytype">
  <div class="container">
    <div class="row">
      <!--左方導覽-->
      <div class="col-3 d-none d-md-block">
        <div class="list-group">
        	<a class="list-group-item list-group-item-action active" aria-current="true">磁鐵購買</a>
        	<a class="list-group-item list-group-item-action<c:if test="${showProduct.category == 'ND'}"> list-group-item-info</c:if>" href="product?magnetType=ND&page=1">1.燒結釹鐵硼</a>
        	<a class="list-group-item list-group-item-action<c:if test="${showProduct.category == 'FE'}"> list-group-item-info</c:if>" href="product?magnetType=FE&page=1">2.鐵氧體磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${showProduct.category == 'RM'}"> list-group-item-info</c:if>" href="product?magnetType=RM&page=1">3.軟性橡膠磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${showProduct.category == 'SM'}"> list-group-item-info</c:if>" href="product?magnetType=SM&page=1">4.釤鈷磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${showProduct.category == 'AL'}"> list-group-item-info</c:if>" href="product?magnetType=AL&page=1">5.鋁鎳鈷磁鐵</a>
        	<a class="list-group-item list-group-item-action<c:if test="${showProduct.category == 'PM'}"> list-group-item-info</c:if>" href="product?magnetType=PM&page=1">6.塑膠磁鐵</a>
        	<a class="list-group-item list-group-item-action disabled" href="product?magnetType=MQ&page=1">7.黏結釹鐵硼<br />　(尚未開賣)</a>
        </div>
      </div>
      <!--右方商品詳細資訊-->
      <div class="col-12 col-md-9 productDetail">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.jsp">首頁</a></li>
                  <li class="breadcrumb-item" aria-current="page"><a href="product?magnetType=all">磁鐵購買</a></li>
				  <li class="breadcrumb-item" aria-current="page"><a href="product?magnetType=${showProduct.category}">${magnetTypeFullName}</a></li>
				  <li class="breadcrumb-item fw-normal fs-6 lh-base active" aria-current="page">${showProduct.productId}</li>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <!--商品詳細頁-->
        <div class="row">
          <div class="col-12 col-lg-6">
            <div class="row">
              <div class="col"><img src="${showProduct.imgurl}" alt=""/></div>
            </div>
          </div>
          <div class="col col-lg-6">
            <div class="row">
              <div class="col-12">
                <div class="productId">${showProduct.productId}</div>
                <div class="productName">${showProduct.productName}</div>
                <div class="price">優惠價 NT$ ${showProduct.price}</div>
              </div>
            </div>
            <hr/>
            <div class="introduction">${showProduct.introduction}</div>
            <hr/>
            <!--此處的#stock value從資料庫讀取-->
            <div class="row">
              <div class="col-2">
                <input id="stock" type="hidden" name="stock" value="${showProduct.stock}"/>
                <div class="input-group"><span>數量</span></div>
              </div>
              <div class="col-10">
                <div class="input-group">
                  <button class="btn btn-outline-primary" type="button" onclick="getnum('-')" <c:if test="${showProduct.stock <= 0}">disabled</c:if> >－</button>
                  <input class="form-control" type="tel" 
                  <c:choose>
	                  <c:when test="${showProduct.stock <= 0}">
	                  	value="0" 
	                  </c:when>
	                  <c:otherwise>
	                  	value="1" 
	                  </c:otherwise>
                  </c:choose>
                  name="num" id="num" onkeyup="chknum();" <c:if test="${showProduct.stock <= 0}">disabled</c:if> />
                  <button class="btn btn-outline-primary" type="button" onclick="getnum('+')" <c:if test="${showProduct.stock <= 0}">disabled</c:if> >＋</button>
                </div>
              </div>
            </div>
            <div class="row col">
              <button class="addProduct btn btn-danger" type="button" onclick="addItemShoppingCart()" <c:if test="${showProduct.stock <= 0}">disabled</c:if> ><i class="fas fa-cart-plus">加入購物車</i></button>
            </div>
          </div>
        </div>
        <div class="introHtmlName">\ 商品介紹 /</div>
        <hr/>
        <div class="introHtml">${introHtml}
        <hr/>
        <div class="row text-center"><a class="previousPage" type="button" href="javascript:history.back();"><i class="fas fa-chevron-left"> 回磁鐵列表頁</i></a></div>
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
<script src="js/product_detail.js"></script>
<script type="text/javascript">
    function result(data,status){
        $(".showlist").html(data);
    }
    
    function addItemShoppingCart(){
    	var num = $("#num").val();
        $.post("template/ShoppingCart.jsp",{"productId":"${showProduct.productId}","num":num,"submit":"add"},result);
        alertify.success('成功加入購物車！<br/>如要結帳請點右上角💰️');
    }
    
    function removeItemShoppingCart(){
         var num = $("#item").val();
         $.post("template/ShoppingCart.jsp",{"productId":"${showProduct.productId}","item":num,"submit":"remove"},result);
    }
</script>
<%-- 此頁JS載入結束 --%>

</body>
</html>