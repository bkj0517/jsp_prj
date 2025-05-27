<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@page import="kr.co.sist.member.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%
//세션에 존재하는 값 얻기
//String name=(String)session.getAttribute("name");
Object obj=session.getAttribute("userData");
if(obj == null){
	//세션에 값이 없다면 페이지를 이동 - 페이지 전체가 응답 한 후 페이지 이동
	//response.sendRedirect("http://192.168.10.84/jsp_prj/day0501/use_session_a.jsp");
	response.sendRedirect("http://192.168.10.84/jsp_prj/index.html");
	return; //아래를 실행하지 않고 끊남.

}//end if
LoginResultDTO lrDTO=(LoginResultDTO)obj;

%>