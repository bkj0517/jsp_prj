<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.84/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 table{width: 350px;}
 th{border: 1px solid #F1234FF; text-align: center; font-weight:bold;}
 td{height:90px;}
</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
   
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
  <div class="collapse text-bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4>템플릿</h4>
          <p class="text-body-secondary">모름.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4>Contact</h4>
          <ul class="list-unstyled">
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>템플릿</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>
<main>
<div id="container">
<%
   LocalDate ld=LocalDate.now();
   int nowYear=ld.getYear();//년
   int nowMonth=ld.getMonthValue();//월
   int lastDayOfMonth=ld.lengthOfMonth();//달의 마지막날
   int nowDay=ld.getDayOfMonth();//날
   //LocalDate : (1~12), Calendar: (0 ~ 11)
   //dayOfWeek - LocalDate :LocalDate.getDayOfWeek().getValue() - 7,1,2,3,4,5,6
   //           Calendar : Calendar.DAY_OF_WEEK - 1,2,3,4,5,6
   Calendar cal=Calendar.getInstance();
   cal.set(nowYear, nowMonth-1, 1);
   int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);//1일 위치(요일)
   
%>
<div style="text-align: center;">
   <h2> <%=nowYear %> - <%=nowMonth %></h2>
</div>
<div>
   <table class="table table-bordered";>
      <tr >
         <th style="color:#FF0000; background-color:#f2f2f2;width:40px;height:40px;">일</th>
         <th style="background-color:#f2f2f2;width:40px;height:40px;">월</th>
         <th style="background-color:#f2f2f2;width:40px;height:40px;">화</th>
         <th style="background-color:#f2f2f2;width:40px;height:40px;">수</th>
         <th style="background-color:#f2f2f2;width:40px;height:40px;">목</th>
         <th style="background-color:#f2f2f2;width:40px;height:40px;">금</th>
         <th style="color:#0000FF; background-color:#f2f2f2;width:40px;height:40px;">토</th>
      </tr>

      <% int cnt=1;
         int rowNum=0; 
         if(lastDayOfMonth%7==0){
            rowNum= lastDayOfMonth/7;
         }else{
            rowNum= lastDayOfMonth/7+1;
         }%>
         
      <% for(int i= 1; i<=rowNum;i++) { %>
               <tr>
         <%  
            for(int j= 1; j<=7; j++) {
               if(i==1 && j<dayOfWeek) {
                  %><td ></td><% 
               }else{
                  if(cnt<= lastDayOfMonth) {
                     if(j==1){%>
                     <td style="color:#FF0000"><%=cnt %></td>
                  <%   }else if(j==7){%>
                     <td style="color:#0000FF"><%=cnt %></td>
                  <%   }else{%>
                        <td ><%=cnt %></td>
                  <%   }
                     cnt++;
                  }else{%>
                     <td></td>
                  <%}//else
               }//else
            }//for j %>
            </tr>
      <%}//for i%>
   </table>
</div>



</div>
</main>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>
</footer>


</body>
</html>