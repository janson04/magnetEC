//載入完網頁執行
$(document).ready(function (){
  $(".header").css("margin-top" , parseInt($("#topnav").css("height")) + 0 + "px")
})

//視窗大小改變時執行
$(window).resize(function(){
  // alert("執行")
  $(".showlist").css("top" , parseInt($("#topnav").css("height")) - 25 + "px")
  $(".header").css("margin-top" , parseInt($("#topnav").css("height")) + 0 + "px")
})

//捲動時執行
$(window).scroll(function(){
  let scrollTop=$(this).scrollTop()
  var max=parseInt($("#magnet_buytype").height())-parseInt($(".list-group").height())
  var ty=scrollTop>max?max:scrollTop
  $(".list-group").css("transform" , "translateY("+ ty +"px)")
})