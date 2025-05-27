<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그아웃"
    %>
    
<%-- <%@ include file="../common/jsp/login_chk.jsp"%> --%>
<%
	session.removeAttribute("name");//세션은 살아있고 값만 삭제
//connecTime과 ip는 살아있다.
	session.invalidate();//세션자체 무효화
	response.sendRedirect("use_session_a.jsp");
/*	
	//무효화 이후에는 세션에가 값을 얻는 작업을 할 수 없다.
	out.println(session.getAttribute("connecTime"));
	out.println(session.getAttribute("ip"));
	out.println(session.getAttribute("name"));
*/
%>

<!-- <meta http-equiv="refresh" content="0;use_session_a.jsp" > -->

<!-- <script type="text/javascript">
	alert("로그아웃 하셨음");
	location.href="use_session_a.jsp";
</script> -->
