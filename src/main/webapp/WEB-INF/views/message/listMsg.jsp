<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">메시지</h1>
</div>
</div>

	<style>
		
	</style>
	
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
	var id = memberId;
	
$(function() {
	getMyMsg();
});

function getMyMsg(){
		$.ajax({
			// "/message/listMsg/{memberType}/{id}"
			url: "${pageContext.request.contextPath}/message/listMsg/"+memberType+"/"+id+"/"+0,
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
					
					var msgNo = v.msgNo;
					var content = v.msgContent;
					var miniContent = content.length > 50 ? content.substr(0,50)+"..." : content; 
					var title = "<strong>보낸이: "+v.teacher.tName +"</strong> |     "+miniContent; 
					var isChecked = v.isChecked == 0? "panel-info":"";
					var collapseTag = 
					"<div class='panel my-msg-panel "+isChecked+"'>"
                    + "<div class='panel-heading'>"
                    +    "<h4 class='panel-title'>"
                    +        "<a data-toggle='collapse' data-parent='#accordion' href='#"+msgNo+"'>"+title+"</a>"
                    +    "</h4>"
                    + "</div>"
                    + "<div id='"+msgNo+"' class='panel-collapse collapse'>"
                    +    "<div class='panel-body'>" + content 
                    + 		"<p style='text-align:right'><a href='"+msgNo+"' class='deleteMsg'><i class='fa fa-trash-o  '></i></p>" 
                    + "</div></div></div>";
                    $("#accordion").append(collapseTag);
				});
			}
		});
	
}

$(document).on("click", ".panel-info", function() {
	$(this).removeClass("panel-info");
	var msgNo = $(this).find(".panel-collapse").attr("id");
	$.ajax({
		url: "${pageContext.request.contextPath}/message/readMsg/"+msgNo,
		type : "get",
		dataType: "json",
		success:function(data){
			console.log(data);
			/* // 메시지 제목
			$(".modal-content .modal-title").html(data.teacher.tName);
			// 메시지 내용
			$(".modal-content .modal-body").html(data.msgContent);
			 */
		}
	});
});

$(document).on("click", ".deleteMsg", function(e) {
	e.preventDefault();
	var msgNo = $(this).attr("href");
	var aTag = $(this);
	if(confirm("해당 메시지를 삭제하시겠습니까?")){
		$.ajax({
			url: "${pageContext.request.contextPath}/message/deleteMsg/"+msgNo,
			type : "delete",
			dataType: "text",
			success:function(data){
				console.log("delete = "+data);
				if(data=="SUCCESS"){
					aTag.parents(".my-msg-panel").remove();
					getMyMsg();					
				}
			}
		});
	}
	
});


</script>