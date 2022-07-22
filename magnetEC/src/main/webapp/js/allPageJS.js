//載入完網頁執行
$(document).ready(function() {
	//偵測是否為行動裝置寬度，決定是否啟用skrollr
	if ($(window).width() > 766) {
		var s = skrollr.init()
	}

	//會員註冊更新頁用
	'use strict';
	window.addEventListener('load', function() {
		var forms = document.getElementsByClassName("needs-validation");
		var validation = Array.prototype.filter.call(forms, function(forms) {
			forms.addEventListener('submit', function(event) {
				if (forms.checkValidity() === false) {
					event.preventDefault();
					event.stopPropagation();
				}
				forms.classList.add('was-validated');
			}, false);
		});
	}, false);
})

$(".header").css("margin-top", parseInt($("#topnav").css("height")) + 0 + "px");

//視窗大小改變時執行
$(window).resize(function() {
	$(".showlist").css("top", parseInt($("#topnav").css("height")) - 25 + "px");
});


//Nav登入用js
// this is the id of the form
$("#loginform,#loginform1,#loginform2").submit(function(e) {
	var nowurl= location.pathname;
	var form = $(this);
	var url = form.attr('action');

	$.ajax({
		type: "POST",
		url: url,
		data: form.serialize(), // serializes the form's elements.
		success: function(data) {
			if (data == "成功登入" || data == "已登入過") {
				$("#closeloginform1").click();
				$("#closeloginform2").click();
				$.ajax({
					type: "POST",
					url: "/magnetEC/template/nav.jsp",
					data: null, // serializes the form's elements.
					success: function(navdata) {
						$("#nav").html(navdata);
					}
				});
				
				if (nowurl.includes("users_login.jsp")){
					window.location.href='users_login_ok.jsp';					
				}
			}else{
				alertify.set({ labels: { ok: "確定", cancel: "取消" } });
				alertify.alert(data);
			}

			//alert(data);
		}
	});

	e.preventDefault(); // avoid to execute the actual submit of the form.
});


//Form手動伺服器自定義驗證用 覆蓋Bootstrap的自動驗證
function InvalidCSS(id) {
	//alert($(id).val());
	$(id).removeClass("is-valid");
	$(id).removeClass("formCheckDefault");
	$(id).removeClass("formCheckValid");

	$(id).addClass("is-invalid");
	$(id).addClass("formCheckInvalid");
}
function ValidCSS(id) {
	//alert($(id).val());
	$(id).removeClass("is-invalid");
	$(id).removeClass("formCheckDefault");
	$(id).removeClass("formCheckInvalid");

	$(id).addClass("is-valid");
	$(id).addClass("formCheckValid");
}
function UnCheckCSS(id) {
	//alert($(id).val());
	$(id).removeClass("is-invalid");
	$(id).removeClass("is-valid");
	$(id).removeClass("formCheckInvalid");
	$(id).removeClass("formCheckValid");

	$(id).addClass("formCheckDefault");
}