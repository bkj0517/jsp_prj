<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /></title>

<c:import url="${ url }/common/jsp/external_file.jsp" />


<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}

</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$.ajax({
			url:"../day0515/json_obj2.jsp",
			type:"GET",
			dataType:"JSON",
			error:function( xhr ){
				alert("문제발생 잠시 후 다시시도");
				console.log( xhr.status );
			},
			success: function( jsonObj ){
				//부가적인 정보
				$("#deptCnt").html( jsonObj.dataLength );
				$("#createDate").html( jsonObj.pubDate );
				
				$("#deptTab tbody").empty();
				//데이터 
				if( !jsonObj.resultFlag ){
					$("#deptTab tbody").append(
				"<tr><td colspan='3'>부서정보가 존재하지 않습니다.</td></tr>");
				}//end if
				
				$.each( jsonObj.data, function( i, jsonTemp ){
					createTr="<tr><td><a href='javascript: searchEmp("+
					jsonTemp.deptno+")'>"+jsonTemp.deptno+"</a></td><td>"+
					jsonTemp.dname+
					"</td><td>"+jsonTemp.loc+"</td></tr>";
					
					$("#deptTab  tbody").append( createTr );
				} );//each
				
			}
		});//ajax
	});//click
});//ready

function searchEmp(deptno){
	//alert(deptno); //안나옴
	
	var param ={ deptno : deptno };
	$.ajax({
		url : "ajax_emp_json.jsp",
		type : "POST",
		data : param,
		dataType :"JSON",
		error : function( xhr ){
			alert("잠시 후 다시 시도");
			 onsole.log( xhr.status+", "+xhr.statusText);
		},
		success : function(jsonObj){
			$("#deptno").html(deptno);
			$("#empTab tbody").empty();
			
			if( !jsonObj.resultFlag){
				$("#empTab tbody")
				.append ("<tr><td colspan='6'>사원이 존재하지 않습니다.</td></tr>");
			}
			
			var createTr;
			$.each(jsonObj.data, function(i,jsonTemp){
				createTr="<tr><td>"+(i+1)+"</td><td>"+jsonTemp.empno
				+"</td><td>"+jsonTemp.ename+"</td><td>"
				+jsonTemp.job+"</td><td>"+jsonTemp.hiredate+
				"</td><td>"+jsonTemp.sal+"</td></tr>";
				
				$("#empTab tbody").append(createTr);
			});//each
		}
	});//ajax
}//searchEmp


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

<input type="button" value="부서정보조회" class="btn btn-success" id="btn">
<div>
<strong>부서수</strong> : <span id="deptCnt"></span><br/>
<strong>데이터 생성일</strong> : <span id="createDate"></span><br/>
</div>
<div style="width: 360px">
<table id="deptTab" class="table table-hover">
<thead>
<tr>
<th style="width: 60px">번호</th>
<th style="width: 150px">부서번호</th>
<th style="width: 150px">위치</th>
</tr>
</thead>
<tbody></tbody>
</table>
</div>
<div style="height: 400px">
<h2>[<span id="deptno" style="width:80px"></span>]번 부서사원 정보</h2>
<div style="width: 650px">
<table id="empTab" class="table table-hover">
<thead>
<tr>
<th style="width: 60px">번호</th>
<th style="width: 80px">사원번호</th>
<th style="width: 120px">사원명</th>
<th style="width: 150px">직무</th>
<th style="width: 120px">입사일</th>
<th style="width: 120px">연봉</th>
</tr>
</thead>
<tbody></tbody>
</table>
</div>

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