<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">메시지</h1>
</div>
</div>

	<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>메시지번호</th>
                                        <th>발신자아이디</th>
										<th>강의번호</th>
										<th>수신자아이디</th>
										<th>메시지 내용</th>
										<th>확인여부</th>
                                    </tr>
                                </thead>
                                <tbody id="tttbody">
                                    
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

	<div class="row">
	
		 <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Hover Rows
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
											<th>메시지번호</th>
                                            <th>발신자아이디</th>
											<th>강의번호</th>
											<th>수신자아이디</th>
											<th>메시지 내용</th>
											<th>확인여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                  
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
	
		<div class="col-lg-3">
		<table border="1">
			<thead>
				<tr>
					<th>발신자아이디</th>
					<th>메시지번호</th>
					<th>강의번호</th>
					<th>수신자아이디</th>
					<th>메시지 내용</th>
					<th>확인여부</th>
				</tr>
			</thead>
			<tbody id="ttbody">
				
			</tbody>
		</table>
		
	</div>
	</div>


<%@ include file="../include/footer.jsp"%>	

<script>
	var id = "aaa01";
$(function() {
	
})
function getMyMsg(){
		$.ajax({
			// "/message/listMySendMsg/{id}"
			url: "${pageContext.request.contextPath}/message/listMySendMsg/"+id,
			type : "get",
			dataType: "json",
			success:function(data){
				console.log(data);
				$("#ttbody").html("");
				$.each(data, function(i, v) {
					var memId = v.sId =! null ? v.sId : v.spId;
					var isCh = v.isChecked != 0? "true":"false";
					var trTag = 
						"<tr>"+
							"<td>"+v.tId+"</td>"+
							"<td>"+v.msgNo+"</td>"+
							"<td>"+v.cNo+"</td>"+
							"<td>"+memId+"</td>"+
							"<td>"+v.msgContent+"</td>"+
							"<td>"+isCh+"</td>"+						
						"</tr>";
					$("#ttbody").append(trTag);
					$("#tttbody").append(trTag);
				});
			}
			
				
		});
}
</script>