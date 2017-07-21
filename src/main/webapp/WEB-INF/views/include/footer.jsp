<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


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
    
    <!-- Morris Charts JS -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> -->
	<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
   
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