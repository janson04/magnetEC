//載入完網頁執行
$(document).ready(function (){
  //偵測是否為行動裝置寬度，決定是否啟用skrollr
  if ($(window).width() > 766) {
    var s = skrollr.init()
  }
})

//視窗大小改變時執行
$(window).resize(function(){
  $(".showlist").css("top" , parseInt($("#topnav").css("height")) -25 + "px");
});

//滑鼠移進#checkout執行
$("#checkout").mouseenter(
  function(){   
    $(".showlist").css("top" , parseInt($("#topnav").css("height")) -25 + "px");
    $(".showlist").slideDown(400);
  }
)


//滑鼠移出.showlist執行
$(".showlist").mouseleave(
  function(){
    $(".showlist").slideUp(400);
  }
)

//除了點選 .showlist 不然都把 .showlist收起來
$("nav,section,.header,footer").click(function(){
    $(".showlist").slideUp(300);
  }
)