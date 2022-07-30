//直接指定購買數量
function setbuynum(num) {
	var error = chknum(num);
	update_cart(num);
}

//購買數量增減1
function getnum(num, var1) {
	if (var1 == '+') {
		$("#buynum" + num).val(parseInt($("#buynum" + num).val()) + 1)
	} else {
		if ($("#buynum" + num).val() > 1) {
			$("#buynum" + num).val(parseInt($("#buynum" + num).val()) - 1)
		}
	}
	var error = chknum(num);
	update_cart(num);
}

//檢查購買數量是否正確(1~目前庫存)
function chknum(num) {
	var error = false;
	var maxnum = $("#stock" + num).val()
	var minnum = $("#stock" + num).val() > 0 ? 1 : 0
	var nownum = $("#buynum" + num).val()

	var stock = $("#stock" + num).val()
	if (parseInt(maxnum) > parseInt(stock)) {
		maxnum = (stock > 0 ? stock : 1)
	}

	var r = /^[0-9]*[1-9][0-9]*$/
	if (!r.test(nownum)) {
		$("#buynum" + num).val(minnum);
		error = true;
		alertify.alert('磁鐵最小購買量為' + minnum);
	}
	if (parseInt(nownum) < parseInt(minnum)) {
		$("#buynum" + num).val(minnum);
		error = true;
		alertify.alert('磁鐵最小購買量為' + minnum)
	}
	if (parseInt(nownum) > parseInt(maxnum)) {
		$("#buynum" + num).val(maxnum);
		error = true;
		alertify.alert('目前庫存量為' + maxnum + ' (如需要更多可接受訂做，歡迎與我們聯絡)');
	}

	return error;
}

function update_cart(num) {
	$.ajax({
		type: "POST",
		async : false,										//是否異步處理，預設值: true
		//cache: false,										//防止抓到快取的回應，預設值: true
		url: "../template/ShoppingCart.jsp",
		data: {
				"productId": $("#product_Id" + num).text(),
				"buynum": $("#buynum" + num).val(),
				"submit": "modify"
              },											//要送到Server的資料
		//contentType:"application/json; charset=utf-8",		//要送到Server的資料型態
		dataType: "html",									//預期從server接收的資料型態，預設值: 智慧選擇(自動根據HTTP的MIME資訊來智慧判斷)
		success: function(response) {
			$(".showlist").html(response);
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	});
	
	updateNav();
	
	$.ajax({
		type: "POST",
		async : false,										//是否異步處理，預設值: true
		//cache: false,										//防止抓到快取的回應，預設值: true
		url: "../template/shoppingCartList.jsp",
		dataType: "html",									//預期從server接收的資料型態，預設值: 智慧選擇(自動根據HTTP的MIME資訊來智慧判斷)
		success: function(response) {
			$("#shoppingCartList").html(response);
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	});

}