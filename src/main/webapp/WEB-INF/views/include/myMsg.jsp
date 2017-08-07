<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="fa fa-comments"></i></h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="temp" type="text/x-handlevars-template">
		{{#each.}}
			<li>
         		<a href="{{msgNo}}" class="readMessage" data-toggle="modal" data-target="#myModal" >
           		<div>
 	            	<span> <span class='{{isCh isChecked}}'></span> 보낸사람 - <strong>{{teacher.tName}}</strong></span>
                    <span class="pull-right text-muted">
                    <i class='fa fa-clock-o fa-fw'></i><em>{{tempdate regDate}}</em>
                    </span>
             	</div>
                <div><p class="txt-width txt-line">{{msgContent msgContent cNo}}</p></div>
          		</a>          
     		 </li>
      
      <li class="divider"></li>
		{{/each}}
		<li>
         <a class="text-center" href="${pageContext.request.contextPath}/message/listMsg">
	         <strong>Read All Messages</strong>
	         <i class="fa fa-angle-right"></i>
         </a>
       </li>
	
	</script>
	<style>
	.txt-width{		
		width:250px; 
	}
	.txt-line { 
		overflow:hidden; 
		text-overflow:ellipsis; 
		white-space: nowrap;
		word-wrap:normal;
	}
</style>
	<script>
	
	var id= memberId;
	var isCheckedCnt = 0;
	
	Handlebars.registerHelper("isCh", function(isChecked) {
		if (isChecked == 0){
			return "glyphicon glyphicon-send";
		}else{
			//return "fa  fa-check-square-o";
		}		
	});
	
	Handlebars.registerHelper("msgTitle", function(msg, cNo) {
		if (cNo == 0){
			return "";
		}else{
			var index = msg.indexOf("]");
			return msg.substring(0,index+1);
		}		
	});
	
	Handlebars.registerHelper("msgContent", function(msg, cNo) {
		var content = "";
		if (cNo == 0){
			content = msg;
		}else{
			var index = msg.indexOf("]");
			content = msg.substring(index+1,msg.length-1);
		}
		return content;
	});
	
	
	Handlebars.registerHelper("tempdate", function(time) {
		return viewTimeStr(time);
	});	
	
	function viewTimeStr(time){
		var regTime = new Date(time);		
		var curTime = new Date();
		var diff = curTime - regTime;
		
		var currMinite = 60 * 1000;// 초 * 밀리세컨
	    var currHour = 60 * 60 * 1000;// 분 * 초 * 밀리세컨
	    var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		
		var result = "";
	    
		if(parseInt(diff/currHour) < 1){
			// 1시간 안
			result = parseInt(diff/currMinite)+"분 전";
		}else if(parseInt(diff/currHour) < 23){
			// 오늘 안
			result = parseInt(diff/currHour)+"시간 전";
		}else if( parseInt(diff/currHour) < 48){
			// 2일 안
			reuslt = "어제";
		}else{
			// 그 이상
			var year = regTime.getFullYear();
			var month = regTime.getMonth()+1;
			var date = regTime.getDate();
			result = year +"/"+ month +"/"+ date;
		}
		
		return result;
	}
	
		function myMsg(){
			$.ajax({
				// "/message/listMsg/{memberType}/{id}/{cnt}"
				url: "${pageContext.request.contextPath}/message/listMsg/"+memberType+"/"+id+"/"+3,
				type : "get",
				dataType: "json",
				success:function(data){
					console.log(data);
					
					$.each(data, function(i, v) {
						if(v.isChecked == 0){
					 		isCheckedCnt++;
					 	}
					});
		
					$("#header-msg").html("");
					var source = $("#temp").html();
					var template = Handlebars.compile(source);
					$("#header-msg").html(template(data));
					
		       		$("#uncheckedMsg").html(isCheckedCnt!=0?isCheckedCnt:"");
		       		$("#uncheckedMsg").addClass("badge");
		       		 
		       		$("#uncheckedMsg").css("font-size", "12px")
		       			.css("position", "relative").css("top", "-5px")
		       			.css("background-color","rgba(10, 30, 200,0.5)");
		       		twinkleTag();
		       		
				}
			});
		}
		
		function twinkleTag(){
			$("#uncheckedMsg").animate({backgroundColor: 'red', opacity: '0.2'}, 800)
				.animate({backgroundColor: 'blue', opacity: '0.6'}, 800, twinkleTag); 
		}
		
		$(function() {
			myMsg();
		});
		
		$(document).on("click", ".readMessage", function(e) {
			e.preventDefault(); 
			var msgNo = $(this).attr("href");
			$.ajax({
				url: "${pageContext.request.contextPath}/message/readMsg/"+msgNo,
				type : "get",
				dataType: "json",
				success:function(data){
					console.log(data);
					// 메시지 제목
					$(".modal-content .modal-title").html(data.teacher.tName);
					// 메시지 내용
					$(".modal-content .modal-body").html(data.msgContent);
					
				}
			});
			
			
			
		});
	</script>