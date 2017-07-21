<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i><span id="uncheckedMsg"></span> <i class="fa fa-caret-down"></i>
</a>

<ul class="dropdown-menu dropdown-messages" id="header-msg">
      <li>
         <a href="#">
            <div>
              <strong>보낸사람</strong>
                    <span class="pull-right text-muted">
                    <em>날짜</em>
                    </span>
             </div>
                 <div>메시지 내용</div>
          </a>          
      </li>
      
      <li class="divider"></li>
                        
      <li>
         <a class="text-center" href="${pageContext.request.contextPath}/message/listMsg">
	         <strong>Read All Messages</strong>
	         <i class="fa fa-angle-right"></i>
         </a>
       </li>
</ul>
<!-- /.dropdown-messages -->