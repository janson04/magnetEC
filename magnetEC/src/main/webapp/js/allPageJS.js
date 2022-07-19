//載入完網頁執行
$(document).ready(function () {
    //偵測是否為行動裝置寬度，決定是否啟用skrollr
    if ($(window).width() > 766) {
        var s = skrollr.init()
    }
})

$(".header").css("margin-top", parseInt($("#topnav").css("height")) + 0 + "px");

//視窗大小改變時執行
$(window).resize(function () {
    $(".showlist").css("top", parseInt($("#topnav").css("height")) - 25 + "px");
});


//Nav登入用js
// this is the id of the form
$("#loginform1,#loginform2").submit(function (e) {

    var form = $(this);
    var url = form.attr('action');

    $.ajax({
        type: "POST",
        url: url,
        data: form.serialize(), // serializes the form's elements.
        success: function (data) {
            if (data == "成功登入" || data == "已登入過") {
                $("#closeloginform1").click();
                $("#closeloginform2").click();
                $.ajax({
                    type: "POST",
                    url: "/magnetEC/template/nav.jsp",
                    data: null, // serializes the form's elements.
                    success: function (navdata) {
                        $("#nav").html(navdata);
                    }
                });
            }
            alertify.set({ labels: { ok: "確定", cancel: "取消" } });
            alertify.alert(data);

            //alert(data);
        }
    });

    e.preventDefault(); // avoid to execute the actual submit of the form.
});