<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String mobileAgree = request.getParameter("mobileAgree") !=null? "true":"false";
  String emailAgree = request.getParameter("emailAgree") !=null? "true":"false";
%>

<h2>회원가입 정보</h2>
<p>아이디: <%=request.getParameter("userId") %></p>
<p>비밀번호: <%=request.getParameter("password") %></p>
<p>이름: <%=request.getParameter("name") %></p>
<p>생일: <%=request.getParameter("birth") %></p>
<p>연락처: <%=request.getParameter("phone1") %></p>
<p>핸드폰: <%=request.getParameter("phone2") %></p>
<p>휴대폰 수신 여부: <%=mobileAgree %></p>
<p>이메일: <%=request.getParameter("emailFront") %>@<%=request.getParameter("emailBack") %></p>
<p>이메일 수신 여부: <%=emailAgree %></p>
<p>성별: <%=request.getParameter("gender") %></p>
<p>소재지: <%=request.getParameter("domain") %></p>
<p>주소: <%=request.getParameter("addr") %> <%=request.getParameter("addr2") %></p>
<p>자기소개: <%=request.getParameter("selfIntro") %></p>
</body>
</html>