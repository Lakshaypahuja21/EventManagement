$("#id_1").click(function(){
	$("#munform").css("display","none")
	$("#buzzform").css("display","none")
	$("#btsform").fadeIn(1000,function(){})
	$(".jumbotron").css("background-image","url(bts.jpg)")


})

$("#id_2").click(function(){
	$("#btsform").css("display","none")
	$("#buzzform").css("display","none")
	$("#munform").fadeIn(1000,function(){})
	$(".jumbotron").css("background-image","url(mun.jpg)")
})

$("#id_3").click(function(){
	$("#btsform").css("display","none")
	$("#munform").css("display","none")
	$("#buzzform").fadeIn(1000,function(){})
	$(".jumbotron").css("background-image","url(buzz.jpg)")
})