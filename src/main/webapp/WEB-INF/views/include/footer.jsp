<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


					</div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
	
	</div><!--  header.jsp <div id="wrapper"> end -->
	
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
	
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
   <%--  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
    
     <!-- DataTables JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
    

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
    
    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/resources/vendor/flot/js/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/flot/js/jquery.flot.pie.js"></script>
    
    <!-- my Calendar -->
    <script src="${pageContext.request.contextPath}/resources/myjs/my_cal.js"></script>
    
    <!-- Morris Charts JS -->
    <script src="${pageContext.request.contextPath}/resources/vendor/raphael/raphael.min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.min.js									"></script>
   
    <!-- my Message -->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<%@ include file="myMsg.jsp"%>
	
	<script>
	$(function() {
		$(".ttDay").each(function(idx, obj) {
			$(obj).html(arrDay[$(obj).html()]);
		})		
	})
	</script>
	
</body>
</html>