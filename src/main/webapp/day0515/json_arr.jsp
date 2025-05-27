<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = "이장훈";
    int age = 25;

    String name2 = "주현석";
    int age2 = 26;

    // 1. JSONArray 생성
    JSONArray jsonArr = new JSONArray();

    // 2. 각각의 JSONObject 생성
    JSONObject jsonObj1 = new JSONObject();
    jsonObj1.put("name", name);
    jsonObj1.put("age", age);

    JSONObject jsonObj2 = new JSONObject();
    jsonObj2.put("name", name2);
    jsonObj2.put("age", age2);

    // 3. JSONArray에 추가
    jsonArr.add(jsonObj1);
    jsonArr.add(jsonObj2);

    // 4. 출력
    String strJSON = jsonArr.toJSONString();
%>
<%= strJSON %>
