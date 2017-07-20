<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<h1>~~~~~~~~~FOOTER~~~~~~~~~</h1>

					</div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
	
	</div><!--  header.jsp <div id="wrapper"> end -->
	
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
    
    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/resources/vendor/flot/js/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/flot/js/jquery.flot.pie.js"></script>
    
    <!-- my Calendar -->
    <script src="${pageContext.request.contextPath}/resources/myjs/my_cal.js"></script>
    
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="temp" type="text/x-handlevars-template">
		{{#each.}}
			<li>
         		<a href="#">
           		<div {{textColorChg isChecked}}>
 	            	<strong>{{msgTitle msgContent cNo}}</strong>
                    <span class="pull-right text-muted">
                    <em>{{tempdate regDate}}</em>
                    </span>
             	</div>
                <div {{textColorChg isChecked}}>{{msgContent msgContent}}</div>
          </a>          
      </li>
      
      <li class="divider"></li>
		{{/each}}
	</script>

	<script>

	var memberType = "student";
	var id="sss01";
	var isCheckedCnt = 0;
	
	Handlebars.registerHelper("textColorChg", function(isChecked) {
		if (isChecked == 0){
			return "class='text-muted'";
		}		
	});
	
	Handlebars.registerHelper("msgTitle", function(msg, cNo) {
		if (cNo == 0){
			return "";
		}else{
			var idx = msg.indexOf("]");
			return msg.substring(0,idx+1);
		}		
	});
	
	Handlebars.registerHelper("msgContent", function(msg) {
		var idx = msg.indexOf("]");
		return msg.substring(idx+1,msg.length-1);
	});
	
	
	Handlebars.registerHelper("tempdate", function(time) {
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
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth()+1;
			var date = dateObj.getDate();
			result = year +"/"+ month +"/"+ date;
		}
		
		return result;
	});	
	
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
					var lastLiTag = 
						"<li>"
							+"<a class='text-center' href='#'>"
							+	"<strong>Read All Messages</strong>"
							+	"<i class='fa fa-angle-right'></i>"
		        			+"</a>"
		       			+"</li>";
		       		$("#header-msg").append(lastLiTag);	
		       		$("#uncheckedMsg").html(isCheckedCnt!=0?isCheckedCnt:"");
		       		
		       		$("#uncheckedMsg").css("font-size", "12px").css("position", "relative").css("top", "-3px").css("padding-left", "3px");
		       		$("#uncheckedMsg").animate({color: 'red', opacity: '0.4'}, "slow");
		       		$("#uncheckedMsg").animate({color: 'blue', opacity: '0.8'}, "slow");
				}
			});
		}
		
		$(function() {
			myMsg();
		})
	</script>
    
</body>
</html>