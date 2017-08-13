<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				보낸메시지
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}">Home</a></li>
				<li class="active">보낸메시지</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->
	
	<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- <div class="panel-heading">
                            	받은 메시지
                        </div>
                        .panel-heading -->
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                            
                            </div>
                        </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
	
<!-- 
	<div class="row">
		<div class="col-md-10">
		<table border="1">
			<thead>
				<tr><th>발신자아이디</th>
					<th>메시지 내용</th>
					<th>확인여부</th>
					<th><i class="fa fa-check"></i></th>
				</tr>
			</thead>
			<tbody id="ttbody">
				
			</tbody>
		</table>
			
		</div>
	</div>	 -->
		

<%@ include file="../include/footer.jsp"%>	

<script>
	
$(function() {
	getMySendMsg();
});

function getMySendMsg(){
	$.ajax({
		// "/message/listMySendMsg/{id}"
		url: "${pageContext.request.contextPath}/message/listMySendMsg/"+memberId,
		type : "get",
		dataType: "json",
		success:function(data){
			console.log(data);
			$("#ttbody").html("");
			$("#accordion").html("");
			$.each(data, function(i, v) {
				var memId = v.sId =! null ? v.sId : v.spId;
				var isCh = v.isChecked == 0? "F":"T";
				var trTag = 
					"<tr>"+
						"<td>"+v.teacher.tName+"선생님("+v.tId+")</td>"+
						/* "<td>"+v.msgNo+"</td>"+
						"<td>"+v.cNo+"</td>"+
						"<td>"+memId+"</td>"+ */
						"<td><p class='txt-line' style='width : 500px'>"+v.msgContent+"</a></td>"+
						"<td>"+isCh+"</td>"+
						"<td><input type='checkbox' name=''></td>"+
					"</tr>";
				$("#ttbody").append(trTag);
				
				var receiver = "";
				if( v.parents.spName != null){
					receiver = v.parents.spName;
				}else if (v.student != null){
					receiver = v.student.sName;
				}
				var msgNo = v.msgNo;
				var content = v.msgContent;
				var miniContent = content.length > 50 ? content.substr(0,50)+"..." : content;
				
				var title = "<strong>받는 사람: "+receiver +"</strong> |     "+miniContent; 
				var isChecked = v.isChecked == 0? "panel-info":"";
				var collapseTag = 
				"<div class='panel my-msg-panel "+isChecked+"'>"
                + "<div class='panel-heading'>"
                +    "<h4 class='panel-title'>"
                +        "<a data-toggle='collapse' data-parent='#accordion' href='#"+msgNo+"'>"+title+"</a>"
                +    "</h4>"
                + "</div>"
                + "<div id='"+msgNo+"' class='panel-collapse collapse'>"
                +    "<div class='panel-body'>"
                + "<p class='text-warning' style='font-size:12px'>보낸시간 : "+viewTime(v.regDate)+"</p>"
                + content 
              /*   + 		"<p style='text-align:right'><a href='"+msgNo+"' class='deleteMsg'><i class='fa fa-trash-o  '></i></p>"  */
                + "</div></div></div>";
                $("#accordion").append(collapseTag);
			});
		}
		
			
	});
}

function viewTime(time){

	var date = new Date(time);
	var viewDate = ""+ date.getFullYear()
				+ "-"+((date.getMonth()+1) <10? "0"+(date.getMonth()+1):(date.getMonth()+1))  
		 	 	+ "-"+(date.getDate()<10?"0"+date.getDate():date.getDate())
				+ " "+(date.getHours()<10?"0"+date.getHours():date.getHours())
				+ ":"+(date.getMinutes()<10?"0"+date.getMinutes():date.getMinutes())
				+ ":"+(date.getSeconds()<10?"0"+date.getSeconds():date.getSeconds());  
	
	return viewDate;
}




</script>
	
