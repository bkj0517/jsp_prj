<%@page import="kr.co.sist.member.MemberDTO"%>
<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/login_chk.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /></title>

<c:import url="${ url }/common/jsp/external_file.jsp" />


<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}
</style>

<script type="text/javascript">
	$(function() {

		$("#btnImg").click(function() {
			$("#profileImg").click();
		});
		$("#profileImg").change(function(evt) {
			//선택한 파일인 이미지인지 체크
			//$("#imgName").val($("#profileImg").val() );//같은 이름이 있을 때 문제가 생김

			//미리보기(1~4)
			//1. HTML FileControl 에 접근
			//이벤트를 밸생시킨 file를 얻고 
			var file = evt.target.files[0];
			//2.스트림을 생성
			var reader = new FileReader();
			//3.FileReader객체의 onload 이벤트 핸들러 설정
			reader.onload = function(evt) { // 파일읽기 작없이 완료(onload)이되면 함수 호출
				//alert(evt.target.result);
				$("#img").prop("src", evt.target.result);//src 속성에 선택한 파일명 설정
			}
			//4. 파일을 읽어들여 img 태그에 미리보기 설정.
			reader.readAsDataURL(file);

			//alert(file);//업로드된 파일명 출력
			//alert(formData);//업로드된 파일명 출력

		});

		$("#btnUpdate").click(
				function() {

					//alert( $("#img")[0].src.lastIndexOf("default.jpg") );
					if (confirm("회원정보를 수정하시겠습니까?")) {
						var uploadFlag = $("#img")[0].src
								.lastIndexOf("default.jpg") == -1; //default의 jpg가 -1

						if (uploadFlag) {
							
						//AJAX File
							//1. input type="file"을 가진 <래그>을 얻어서
							var frm = $("#frm")[0]; //명확하게 하기 위해 // parameter전송방식 : 파일 업로드가 되지 않는다.
							var formData = new FormData(frm);//binary전송방식 : 파일 업로드 가능
							$.ajax({
								url : "profile_upload.jsp",
								contentType : false,
								processData : false,
								data : formData,
								type : "post",
								dataType : "json",
								error : function(xhr) {
									console.log(xhr.status);
								},
								success : function(jsonObj) {
									if (jsonObj.resultFlag) {
										$("#imgName").val(jsonObj.fileName);
										//이미지 업로드 된 후 form submit 수행
										$("#frm").submit();
									} else {
										console.log("프로필 이미지가 업로드 되지 않았습니다.");
									}
								}//success
							});//ajax

						}//이미지 업로드
						
						
					}//end if

				});//click

	}); // ready
</script>

</head>
<body>
	<header data-bs-theme="dark">

		<c:import url="${ url }/common/jsp/header.jsp" />

	</header>
	<main>
		<div id="container">

			<%
			String id = ((LoginResultDTO) session.getAttribute("userData")).getId();

			MemberService ms = new MemberService();
			MemberDTO mDTO = ms.searchOneMember(id);
			if (mDTO == null) {
				response.sendRedirect("http://localhost/jsp_prj");
				return;
			} //end if
			pageContext.setAttribute("mDTO", mDTO);
			%>
			<div>

				<h3>마이페이지</h3>
				<form action="mypage_process.jsp" method="post" name="frm" id="frm">
					<div style="float: left; width: 210px; height: 200px;">

						<img src="${mDTO.profile_img eq 'default.jpg'?"../common/images" : uploadURL}/${mDTO.profile_img }"
							style="width: 130px; height: 200px" id="img" /> <br> <br>
						<input type="button" value="이미지선택" id="btnImg" name="btnImg"
							class="btn btn-info btn-sm" /> <input type="hidden"
							name="imgName" id="imgName" /> <input type="file"
							style="display: none" name="profileImg" id="profileImg" />
					</div>

					<table style="float: left;">
						<tr>
							<td>이름</td>
							<td><c:out value="${mDTO.name }" /></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name="birth" value="${mDTO.birth }" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" value="${mDTO.tel }" /></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" name="gender" value="남자"
								${mDTO.gender eq '남자'?" checked='checked' ":""} />남자 <input
								type="radio" name="gender" value="여자"
								${mDTO.gender eq '여자'?" checked='checked' ":""} />여자</td>
						</tr>
						<tr>
							<td>가입시 사용된 ip address</td>
							<td><c:out value="${ mDTO.ip }" /></td>
						</tr>
						<tr>
							<td>가입일</td>
							<td><fmt:formatDate value="${ mDTO.input_date }"
									pattern="yyyy-MM-dd a EEEE HH:mm" /></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><input
								type="button" id="btnUpdate" name="btnUpdate" value="정보변경"
								class="btn btn-success btn-sm" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</main>

	<footer class="text-body-secondary py-5">

		<c:import url="${ url }/common/jsp/footer.jsp" />

	</footer>


</body>
</html>