<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%	
	/*
    // 驗證機制 - param.transportRadios & param.payRadios
	// 判斷是否有運送方式跟付款方式的param，不然就切回結帳的第一頁
	if (request.getParameter("transportRadios") == null || request.getParameter("payRadios") == null 
		|| request.getParameter("phone") == null || request.getParameter("name") == null) {
		// 跳轉至結帳第一頁
		response.sendRedirect("cart_start.jsp");
		return;
	}
	*/
	
	
	// 取出所有Parameter
	System.out.println("------cart_complete.jsp: 開始取出Parameter------");
	request.setCharacterEncoding("UTF-8");

	// 返回包含名稱的字符串對象的Enumeration
	// 此request中包含的parameters。
	Enumeration paramNames = request.getParameterNames();

	// 如果enumeration包含更多的 elements，則讀取下一個(nextElement)繼續取出
	while (paramNames.hasMoreElements()) {
		String paraName = (String) paramNames.nextElement();
		System.out.print(paraName + ": ");
		String[] paramValues = request.getParameterValues(paraName);
		// 當此參數只有一個時
		if (paramValues.length == 1) {
			String paramValue = paramValues[0];
			if (paramValue.length() == 0) {
				System.out.println("null");
			} else {
				System.out.println(paramValue);
			}
		} else {
			// 當此參數有好幾個值時
			for (int i = 0; i < paramValues.length; i++) {
				System.out.print(paramValues[i] + "\t");
			}
			System.out.println("");
		}
	}
	System.out.println("------cart_complete.jsp: 結束取出Parameter------");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單 - 磁鐵超市</title>

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
                            <div class="col d-none d-sm-block">
                                <button
                                    class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-secondary rounded-pill"
                                    type="button" style="width: 10rem; height:2.3rem;">01 / 運送付款方式</button>
                            </div>
                            <div class="col d-none d-sm-block">
                                <button
                                    class="position-absolute top-0 translate-middle btn btn-sm btn-secondary rounded-pill"
                                    type="button" style="width: 10rem; height:2.3rem; left: 46%">02 / 填寫訂購資料</button>
                            </div>
                            <div class="col">
                                <button class="position-absolute top-0 translate-middle btn btn-sm btn-primary rounded-pill"
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
                <div class="fas fa-clipboard-list"> 完成訂購</div>
            </div>
            <div class="row col-12 col-md-10 mx-auto">
                <div class="text-center mb-3">感謝您的訂購，下方為訂購完成之資訊</div>
            </div>
            <div class="container col-10 col-lg-8 text-center lh-lg" id="OrderComplete">
                <div class="col-10 mx-auto">
                    <span>訂單號碼</span>
                    <span class="text-primary fs-5" id="orderId">【${requestScope.order_id}】</span><br />
                    <span>運送方式為</span>
                    <span class="text-primary fs-5" id="shippingmethod">【${requestScope.shippingmethod}】</span><br />
                    <span>付款方式為</span>
                    <span class="text-primary fs-5" id="paymethod">【${requestScope.paymethod}】</span><br />
                    <span>訂單金額為</span>
                    <span class="text-primary fs-5" id="sum">【NT$ ${requestScope.sum}】</span><br />
                    <c:if test="${requestScope.paymethod == '線上刷卡'}"><span>您選擇的是線上刷卡，會自動跳轉至刷卡頁面；</span><br /></c:if>
                    <c:if test="${requestScope.paymethod == '匯款'}"><span>您選擇的是匯款，請按照下方匯款帳號匯款；</span><br /></c:if>
                    <c:if test="${requestScope.paymethod == '貨到付款'}"><span>您選擇的是貨到付款，當配送時送貨員會跟您收取現金，敬請備妥</span><br /></c:if>
                    <span>謝謝您的支持！</span>
                </div>
            </div>
        </div>
    </section>
    <c:if test="${requestScope.paymethod == '匯款'}">
	    <section class="mx-2 my-4" id="remittance">
	        <div class="container">
	            <div class="container col-10 col-lg-8 text-center lh-lg" id="OrderComplete">
	                <div class="col-10 col-md-6 col-lg-5 mx-auto text-center">
	                    <div class="row text-center">
	                        <div class="col h4 fw-bold">匯款資訊</div>
	                    </div>
	                    <div class="row col">銀行：永豐銀行 (807)</div>
	                    <div class="row col">分行：南內湖分行(1430)</div>
	                    <div class="row col">帳號：143-20-2893595</div>
	                    <div class="row col">戶名：磁鐵實業股份有限公司 　</div>
	                    <div class="row text-center pt-2">
	                        <div class="col fw-bolder">匯款完成請在通知敝司，謝謝😊</div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
    </c:if>
    <div class="container">
        <div class="text-center my-3 mx-2">
            <button class="btn btn-sm btn-primary" onclick="window.location.href='/magnetEC/index.jsp'">
            <i class="fas fa-house">首頁</i></button>
            <button class="btn btn-sm btn-primary" onclick="window.location.href='/magnetEC/product?magnetType=all'">
            <i class="fas fa-magnet">瀏覽磁鐵</i></button>
            <button class="btn btn-sm btn-primary" onclick="window.location.href='/magnetEC/users/users_queryorder'">
            <i class="fas fa-magnifying-glass">訂單查詢</i></button>
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
<%-- 此頁JS載入結束 --%>

</body>
</html>