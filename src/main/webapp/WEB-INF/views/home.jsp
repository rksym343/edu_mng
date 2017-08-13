<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/header.jsp"%>


<style>
	.cItem{
		display : block;
		width : 100%;
		height : 100%;	
		position: relative;
	}
	.cImage{
		width : 700px;
		height : 250px;	
	}

	.cTitle{
		position: absolute;
		bottom : 30px;
		right : 0;
		padding :  0 10px;
		background-color: rgba(0,0,0,0.7);
		color : white;
		text-align: right;
		height : 40px;
		line-height : 40px;
		font-size: 16px;
		margin : 0;
	}
	.cTitle:hover{
		color : white;
		font-weight: bold;
	}
	
	.moreIcon{
		display : none;
		position: absolute;
		top : 0;
		left : 0;
		width : 100%;
		height : 100%;
		color : white;	
		background-color: rgba(0,153,102,0.7);
		text-align: center;
		
	}
</style>
<body>

    

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/image/header1.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/image/header2.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/image/header3.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">

        

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">
                	개설강좌
                	<a href="${pageContext.request.contextPath}/course/listCourses" class="btn btn-default btn-xs">more</a>
                </h2>
            </div>
            
            <c:forEach items="${listCourses }" var="course">  
	            <div class="col-md-4 col-sm-6">
	                <a onclick="readCourse(${course.cNo})" class="cItem  img-hover">
	                    <img class="img-responsive img-portfolio cImage" 
	                    	src="${pageContext.request.contextPath}/file/displayFile?filename=${course.pictures[0].cPicture }" alt="">
	                    <p class="cTitle">${course.cName }</p>
	                    <i class="fa fa-search-plus fa-5x moreIcon "></i>
	                </a>
	                
	            </div>
            </c:forEach>
            
        </div>
        <!-- /.row -->

     <!-- Features Section -->
        <!--    <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Modern Business Features</h2>
            </div>
            <div class="col-md-6">
                <p>The Modern Business template by Start Bootstrap includes:</p>
                <ul>
                    <li><strong>Bootstrap v3.3.7</strong>
                    </li>
                    <li>jQuery v1.11.1</li>
                    <li>Font Awesome v4.2.0</li>
                    <li>Working PHP contact form with validation</li>
                    <li>Unstyled page elements for easy customization</li>
                    <li>17 HTML pages</li>
                </ul>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
            </div>
            <div class="col-md-6">
                <img class="img-responsive" src="http://placehold.it/700x450" alt="">
            </div>
        </div>
        /.row

        <hr> -->

      
<%@ include file="include/page_footer.jsp"%>

<script type="text/javascript">
	$(function() {
		$(window).resize(function(){
			$(".cTitle").css("width", $(".cImage").css("width"));
			$(".moreIcon").css("height", $(".cImage").css("height"));
			$(".moreIcon").css("line-height", $(".cImage").css("height"));
		}).resize();
		
		$(".cItem").hover(
			function() {
				var idx = $(".cItem").index(this);
				$(".moreIcon").eq(idx).css("display","block");
			},
			function() {
				$(".moreIcon").css("display","none");  
			}
		);
		
	});
	
	function readCourse(cNo){
		//var cri = $(".c-"+cNo).attr("data-cri");
		location.href="${pageContext.request.contextPath}/course/readCourse?cNo="+cNo;
	}
</script>
    