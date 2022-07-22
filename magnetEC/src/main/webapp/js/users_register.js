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
  $("#users_id").removeClass("formCheckInvalid");
  $("#users_id").removeClass("formCheckValid");
  $("#users_id").addClass("formCheckDefault");
}