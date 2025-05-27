<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.84/html_prj/common/images/favicon.ico"/>

<!-- site 기본 CSS -->
<link rel="stylesheet" type="text/css"
 href="http://192.168.10.84/html_prj/common/css/main_v250409.css"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">

<style type="text/css">

div{ border: 1px solid #333; width: 400px; height:200px;}
</style>

<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
   $("#ssn1").on("input",function(){
      if( $("#ssn1").val().length===6){
         $("#ssn2").focus();
      }//if
   });
   
   
   $("#ssn2").on("input",function(){
      if($("#ssn2").val().length===7){
         var ssn1=$("#ssn1").val();
         var ssn2=$("#ssn2").val();
         var ssn=ssn1+ssn2;
         
         var sum=0;
         var verArr=[2,3,4,5,6,7,8,9,2,3,4,5];
         
         for(var i=0;i<12;i++){
            sum+=parseInt(ssn.charAt(i))*verArr[i];
         }
         var na=sum%11;
         var three=11-na;
         var four=three%10;
         
         var output="";
         if(four===parseInt(ssn.charAt(12))){
            output="유효한 주민번호 입니다.";
         }else{
            output="유효하지 않은 주민번호 입니다.";
         }
         
      }//if
      $("#output").html(output);
   });
   
   
});// function


</script>
</head>
<body>
<form  name="frm">
<label for="ssn1">주민번호</label><br><input type="text" name="ssn1" id="ssn1" maxlength="6"/>-<input type="text" name="ssn2" id="ssn2" maxlength="7"/> <br>
<div id="output"></div>
</form>
</body>
</html>