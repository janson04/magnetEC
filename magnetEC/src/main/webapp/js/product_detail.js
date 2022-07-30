//數量增減
function getnum(var1) {
	if (var1 == '+') {
		$("#buynum").val(parseInt($("#buynum").val()) + 1)
		chknum();
	} else {
		if ($("#buynum").val() > 1) {
			$("#buynum").val(parseInt($("#buynum").val()) - 1)
			chknum();
		}
	}
}

//檢查數量是否正確(1~目前庫存)
function chknum() {
	var maxnum = $("#stock").val()
	var minnum = $("#stock").val() > 0 ? 1 : 0
	var nownum = $("#buynum").val()

	var stock = $("#stock").val()
	if (parseInt(maxnum) > parseInt(stock)) {
		maxnum = (stock > 0 ? stock : 1)
	}

	var r = /^[0-9]*[1-9][0-9]*$/
	if (!r.test(nownum)) {
		$("#buynum").val(minnum)
		alertify.alert('磁鐵最小購買量為' + minnum);
	}
	if (parseInt(nownum) < parseInt(minnum)) {
		$("#buynum").val(minnum)
		alertify.alert('磁鐵最小購買量為' + minnum)
	}
	if (parseInt(nownum) > parseInt(maxnum)) {
		$("#buynum").val(maxnum)
		alertify.alert('目前庫存量為' + maxnum + ' (如需要更多可接受訂做，歡迎與我們聯絡)')
	}
}