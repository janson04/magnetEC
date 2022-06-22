<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>磁鐵超市-磁鐵的行家</title>

<%-- 此頁CSS載入開始 --%>
<link rel="stylesheet" href="css/index.css" type="text/css" />
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

<div class="header jumbotron">
  <div class="container">
    <h1 data-0="transform: translateY(-8px)" data-100="transform: translateY(150px)">磁鐵</h1>
    <h3 data-0="transform: translateY(-15px)" data-100="transform: translateY(160px)">磁鐵或稱磁石，是可以吸引鐵並於其外產生磁場的物體。</h3>
  </div>
</div>
<section id="story">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 storyimg" data-0="transform: translateX(-50px)" data-500="transform: translateX(0px)"></div>
      <div class="col-sm-6">
        <h2 data-0="transform: translateY(-20px); opacity: 0" data-center="transform: translateY(0px); opacity: 1">磁鐵歷史</h2>
        <p data-0="transform: translateY(-20px); opacity: 0" data-center="transform: translateY(0px); opacity: 1">古代人們是從天然磁石中認識磁性，天然磁石一般是在自然界被磁化的鐵礦石，會吸引鐵的物品。希臘文的磁鐵意思是「來自馬格尼西亞（Magnesia）的石頭」，懸吊著的天然磁石就是最早的指南針。已知最早記載磁鐵及其性質的文獻是在二千五百年前，來自希臘、印度及中國的文獻。古羅馬作家老普林尼在《博物志》就已記載天然磁石及其可以吸收鐵的特性。中國文獻對天然磁石吸引鐵以製備磁鐵的描述於《管子》、《呂氏春秋》及《淮南子》中提及，被稱為「慈石」。</p>
      </div>
    </div>
  </div>
</section>
<section id="magnet_type">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h2>磁鐵種類 </h2>
      </div>
      
      <div class="col-sm-6" id="ND">
        <div class="img_wrap" data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1"><img src="https://www.ezb2b.com/images/2017prod_5357_5856725_275421_0654.png" alt=""/></div><i class="fas fa-magnet fa-1x"></i>
        <a href="product?magnetType=ND&page=1" style="color: black; text-decoration: none;">
        	<h3 data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">燒結釹鐵硼磁石</h3>
        	<p data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">燒結釹鐵硼磁石目前為磁力最強的磁鐵，廣泛應用在各領域，尤其是電子電機、醫療機器、包裝、五金機械、航空科技</p>
        </a>
      </div>
      <div class="col-sm-6" id="FE">
        <div class="img_wrap" data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1"><img src="https://im01.itaiwantrade.com/769d2d98-33fb-4104-8fd9-ffd8571c50f6/Ferrite.JPG" alt=""/></div><i class="fas fa-magnet fa-1x"></i>
        <a href="product?magnetType=FE&page=1" style="color: black; text-decoration: none;">
        	<h3 data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">鐵氧體磁石</h3>
        	<p data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">鐵氧體磁石是世界上使用最多的磁石材料，主要是以乾溼壓模或切割製成，磁石原料是三氧化二鐵，主要運用在電子電機、醫療產業、自動化產業。</p>
        </a>
      </div>
      <div class="col-sm-6" id="SM">
        <div class="img_wrap" data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1"><img src="https://www.ezb2b.com/images/2021prod_5357_7594976_62899_1704.jpg" alt=""/></div><i class="fas fa-magnet fa-1x"></i>
        <a href="product?magnetType=SM&page=1" style="color: black; text-decoration: none;">
        	<h3 data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">釤鈷磁石</h3>
        	<p data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">釤鈷永久磁石是由稀土元素，氧化釤、氧化鈷等金屬化合物，經高溫熔煉、製粉、壓胚與結燒而成，具有耐酸鹼跟耐高溫特性，且尺寸精準、磁力接近於釹鐵硼強力磁鐵。可用在DC直流無刷馬達、泵浦、鐘錶元件、強力發電機等用途</p>
        </a>
      </div>
      <div class="col-sm-6" id="RM">
        <div class="img_wrap" data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1"><img src="https://www.ezb2b.com/images/2021prod_5357_7981313_102942_4650.jpg" alt=""/></div><i class="fas fa-magnet fa-1x"></i>
        <a href="product?magnetType=RM&page=1" style="color: black; text-decoration: none;">
        	<h3 data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">軟性橡膠磁石</h3>
        	<p data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">軟性永久磁石是將鐵氧體磁粉或釹鐵硼磁粉混合橡膠、樹脂與其他材料後擠壓、射出、沖型或壓延製片方式製成條狀、或捲狀。主要運用在廣告文宣、禮贈品、機械零件、馬達零件等用途。</p>
        </a>
      </div>
      <div class="col-sm-4" id="AL">
        <div class="img_wrap" data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1"><img src="https://www.ezb2b.com/images/2021prod_5357_4621095_86535_2154.jpg" alt=""/></div><i class="fas fa-magnet fa-1x"></i>
        <a href="product?magnetType=AL&page=1" style="color: black; text-decoration: none;">
        	<h3 data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">鋁鎳鈷磁石</h3>
        	<p data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">鋁鎳鈷合金永久磁石是一種金屬合金磁石，製造方式分鑄造成型及燒結成型，具有較高溫度係數及不易破碎特性。主要運用在揚聲器元件、發電機元件、儀錶元件等用途。</p>
        </a>
      </div>
      <div class="col-sm-4" id="MQ">
        <div class="img_wrap" data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1"><img src="https://www.ezb2b.com/images/2021prod_5357_3944991_89289_5236.jpg" alt=""/></div><i class="fas fa-magnet fa-1x"></i>
        <!-- <a href="product?magnetType=MQ&page=1" style="color: black; text-decoration: none;"> -->
        	<h3 data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">粘結釹鐵硼磁石</h3>
        	<p data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">主原料同燒結釹鐵硼，但製程不一樣<br>需要開模具製作，雖然磁力稍弱於燒結釹鐵硼的，但因為模具生產可製作較為特殊的設計。可用於震動馬達元件、步進馬達元件、磁簧感應元件等用途。</p>
        <!-- </a> -->
      </div>
      <div class="col-sm-4" id="PM">
        <div class="img_wrap" data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1"><img src="https://www.magtech.com.tw/chinese/Product-2006818115229-s.jpg" alt=""/></div><i class="fas fa-magnet fa-1x"></i>
        <a href="product?magnetType=PM&page=1" style="color: black; text-decoration: none;">
        	<h3 data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">塑膠射出磁石</h3>
        	<p data-bottom-top="transform: translateY(-50px);opacity: 0" data-center="transform: translateY(0px);opacity: 1">塑膠射出磁石擁有高精密度、形狀複雜、能多極充磁，且擁有良好的韌性不易碎裂等特性，可運用於耳機元件、印表機用磁棒、無刷馬達元件等用途。</p>
        </a>
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
<%-- 此頁JS載入結束 --%>

</body>
</html>