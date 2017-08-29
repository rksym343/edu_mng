<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p style="text-align: center">Copyright &copy; minimmaa@gmail.com</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->
    
<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    
    
    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
    
     <!-- Morris Charts JS -->
    <script src="${pageContext.request.contextPath}/resources/vendor/raphael/raphael.min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.min.js"></script>
    
     <!-- my Calendar -->
    <script src="${pageContext.request.contextPath}/resources/myjs/my_cal.js"></script>
    
    <!-- my Message -->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<%@ include file="myMsg.jsp"%>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    
	$(function() {
		$(".ttDay").each(function(idx, obj) {
			$(obj).html(arrDay[$(obj).html()]);
		})		
	})
    </script>

</body>

</html>
