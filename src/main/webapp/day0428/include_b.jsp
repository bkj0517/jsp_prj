<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="포함"%>
<!-- info가 한쪽에만 있거나, 같은 값이면 괜찮다. 다른 값으로 있으면 error  -->
<% String name=new Random().nextBoolean()?"강태일":""; %>
<%-- <%= name %>님 안녕하세요? --%>
<%!
	public String addr(){
		return "우리집";
	}//addr

%>
