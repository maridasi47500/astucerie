$(function(){
	$("span.mystar").click(function(){
		for (var i = 0;i<5;i++){
			$("span.mystar")[i].onmouseleave=function(e){return false;};
			$("span.mystar")[i].onmouseenter=function(e){return false;};
		}
		var mynote=$(this)[0].dataset.id;

		$.ajax({url: $("#myroutenote").html(), type:"post",
			data:{note:{tip_id:$("#mytipid").html(),note: mynote, user_id:$("#userid").html()}},
			success:function(data){
		          $(".note_total_nb").html("("+data.nbnote+")");
		var note=data.moy;
		for (var i = 0;i<note;i++){
			$($(".notemoystar")[i]).addClass("yellow")
		}
			}});

	});
	$("a.addtofav").click(function(){
		$.ajax({url: $("#myroutefav").html(), type:"post",
			data:{myfav:{tip_id:$("#mytipid").html(),user_id:$("#userid").html()}},
			success:function(data){
		var nbalerts=data.total_number;


		$("span.nb_tips").html(nbalerts+"<span class=\"visually-hidden\">New alerts</span>")
			}});

		return false;
	});
	$(".addremovefav").click(function(){
		var myid=$(this)[0].dataset.id;
		var myroute;
		if ($(this)[0].dataset.inmyfav === "true"){
		myroute=$("#myroutedeletefav").html();
	}else{
		myroute=$("#myroutefav").html();


	}
		$.ajax({url: myroute, type:"post",
			data:{myfav:{tip_id:myid,user_id:$("#userid").html()}},
			success:function(data){
		var nbalerts=data.total_number;
				console.log(data);


		$("[data-id="+data.tip_id+"]")[0].dataset.inmyfav=(String(data.addedtomyfavyesno));
		$("[data-id="+data.tip_id+"]").html(data.addedtomyfav);
		$("span.nb_tips").html(nbalerts+"<span class=\"visually-hidden\">New alerts</span>")
			}});

		return false;
	});
});
