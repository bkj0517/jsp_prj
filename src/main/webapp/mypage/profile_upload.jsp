<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
Object obj=session.getAttribute("userData");

JSONObject jsonObj=new JSONObject();
boolean resultFlag=obj != null;
jsonObj.put("resultFlag",resultFlag);
if( resultFlag ){// 로그인이 되어있는 상태
	//파일 업로드 수행
	File saveDir=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
	int maxSize=1024*1024*10;
	MultipartRequest mr=new MultipartRequest(request,saveDir.getAbsolutePath(),maxSize,"UTF-8",
			new DefaultFileRenamePolicy());
	
	String fileName=mr.getFilesystemName("profileImg");//내가 올린 파일명
	
	//파일명 설정
	jsonObj.put("fileName",fileName); //resultFlag가 false면fileName이 없다

}//end if
out.print( jsonObj.toJSONString() ); // { resultFlag: true , fileName : "파일명"}
//resultFlag: true는 반드시 있고 , fileName : "파일명"는 없을 수 있다.
%>