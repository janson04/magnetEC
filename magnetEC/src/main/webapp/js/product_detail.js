//載入完網頁執行
$(document).ready(function (){
  // alert("測試");
  
  //偵測是否為行動裝置寬度，決定是否啟用skrollr
  if ($(window).width() > 766) {
    var s = skrollr.init()
  }
})
  
$(".header").css("margin-top" , parseInt($("#topnav").css("height")) + 0 + "px");

//視窗大小改變時執行
$(window).resize(function(){
    // alert("執行");
  $(".showlist").css("top" , parseInt($("#topnav").css("height")) - 25 + "px");
  $(".header").css("margin-top" , parseInt($("#topnav").css("height")) + 0 + "px");
});

  
//捲動時執行
$(window).scroll(function(){
  let scrollTop=$(this).scrollTop()
  var max=parseInt($("#magnet_buytype").height())-parseInt($(".list-group").height())
  var ty=scrollTop>max ? max : scrollTop
  $(".list-group").css("transform" , "translateY("+ ty +"px)")
})


//滑鼠移進#checkout執行
$("#checkout").mouseenter(
  function(){   
    $(".showlist").css("top" , parseInt($("#topnav").css("height")) -25 + "px");
    // $(".showlist").fadeIn(300);
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

//此份新增
//數量增減
function getnum(var1){
  if (var1 == '+'){
    $("#num").val( parseInt($("#num").val()) + 1)
    chknum();
  }else{
    if($("#num").val()>1) {
      $("#num").val( parseInt($("#num").val()) - 1)
      chknum();
    }
  }
}

//檢查數量是否正確(1~目前庫存)
function chknum(){
	var maxnum = $("#stock").val()
	var minnum = $("#stock").val()>0?1:0
	var nownum = $("#num").val()

	var stock  = $("#stock").val()
	if( parseInt(maxnum) > parseInt(stock) ) {
		maxnum = (stock>0?stock:1)
	}
	
	var r = /^[0-9]*[1-9][0-9]*$/ 
	if(!r.test(nownum)){
		$("#num").val(minnum)
		alertify.alert('磁鐵最小購買量為'+minnum);
	}
	if(parseInt(nownum) < parseInt(minnum) ){
		$("#num").val(minnum)
		alertify.alert('磁鐵最小購買量為'+minnum)
	}
	if(parseInt(nownum) > parseInt(maxnum) ){
		$("#num").val(maxnum)
		alertify.alert('目前庫存量為'+maxnum+' (如需要更多可接受訂做，歡迎與我們聯絡)')
	}
}

function addProduct(){
	alert("加入購物車成功!");
}