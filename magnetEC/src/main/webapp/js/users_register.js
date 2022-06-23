//載入完網頁執行
$(document).ready(function() {     //ready都會執行
  //--此份新增--!!開始!!
  //會員註冊頁用
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
  //--此份新增--!!結束!!
});


//確認密碼
function formcheck(){
  if ($("#users_password").val() == $("#checkpassword").val()) {
	  if($("#users_id").filter(".is-invalid").length == 0){
			return true;
		}else{
			alertify.error("發現帳號重複，請輸入其它帳號");
			return false;
		}
    } else {
      $("#valid-checkpassword").css("display","none");
      alertify.error("確認密碼跟密碼不相符，請檢查並重新輸入");
      return false;
    }
}

//清除重寫
function clearAll() {
  $("input").val('');
  $("form").removeClass("was-validated");
  $("#users_id").removeClass("is-valid");
  $("#users_id").removeClass("is-invalid");
}