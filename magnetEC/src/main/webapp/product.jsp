<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>磁鐵購買</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="css/product.css" type="text/css" />
<%-- 此頁CSS載入結束 --%>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.core.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.default.min.css'>
<link rel="stylesheet" href="css/navfooter.css" type="text/css" />

</head>
<body>
<jsp:include page="template/nav.html"></jsp:include>
<%-- 開始 --%>

<div class="header jumbotron"></div>
<!--左方導覽+右方商品列表-->
<section id="magnet_buytype">
  <div class="container">
    <div class="row">
      <!--左方導覽-->
      <div class="col-3">
        <div class="list-group"><a class="list-group-item list-group-item-action active" aria-current="true">磁鐵購買</a><a class="list-group-item list-group-item-action" href="">1.燒結釹鐵硼</a><a class="list-group-item list-group-item-action" href="">2.鐵氧體磁鐵</a><a class="list-group-item list-group-item-action" href="">3.軟性橡膠磁鐵</a><a class="list-group-item list-group-item-action" href="">4.釤鈷磁鐵</a><a class="list-group-item list-group-item-action" href="">5.鋁鎳鈷磁鐵</a><a class="list-group-item list-group-item-action" href="">6.塑膠磁鐵</a><a class="list-group-item list-group-item-action disabled">7.黏結釹鐵硼<br />　(尚未開賣)</a></div>
      </div>
      <!--右方商品列表-->
      <div class="col-9">
        <!--層次結構導航-->
        <div class="row" data-0="transform: translateY(0px)" data-100="transform: translateY(18px)">
          <div class="col">
            <h5>
              <nav style="--bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">首頁</a></li>
                  <li class="breadcrumb-item active" aria-current="page">磁鐵購買</li>
                </ol>
              </nav>
            </h5>
          </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
          <div class="col"><a href="#"> 
              <div class="card"><img class="card-img-top" src="https://www.msmt.com.tw/upload/2019092017015367wyv1.jpg" alt="..."/>
                <div class="card-body">
                  <h5 class="card-title">D5x2mmT-燒結釹鐵硼磁鐵</h5>
                  <p class="card-text">NT$ 3</p>
                </div>
              </div></a></div>
          <div class="col"><a href="#"> 
              <div class="card"><img class="card-img-top" src="https://www.msmt.com.tw/upload/20190920172138i72ix1.jpg" alt="..."/>
                <div class="card-body">
                  <h5 class="card-title">D5x3mmT-燒結釹鐵硼磁鐵</h5>
                  <p class="card-text">NT$ 4</p>
                </div>
              </div></a></div>
          <div class="col"><a href="#"> 
              <div class="card">
                <div class="aa"><img class="card-img-top" src="https://www.msmt.com.tw/upload/20190920172714e32rk1.jpg" alt="..."/></div>
                <div class="card-body">
                  <h5 class="card-title">D5x5mmT-燒結釹鐵硼磁鐵</h5>
                  <p class="card-text">NT$ 5</p>
                </div>
              </div></a></div>
          <div class="col"><a href="#"> 
              <div class="card"><img class="card-img-top" src="https://www.msmt.com.tw/upload/201910141441278ojuq1.jpg" alt="..."/>
                <div class="card-body">
                  <h5 class="card-title">D6x12mmT-燒結釹鐵硼磁鐵</h5>
                  <p class="card-text">NT$ 19</p>
                </div>
              </div></a></div>
        </div>
        <div class="row">
          <div class="col-12 pageSelection">
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
<script src='https://cdn.bootcdn.net/ajax/libs/skrollr/0.6.9/skrollr.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js'></script>
<script src="js/allPageJS.js"></script>

<%-- 此頁JS載入開始 --%>
<script src="js/product.js"></script>
<%-- 此頁JS載入結束 --%>

</body>
</html>