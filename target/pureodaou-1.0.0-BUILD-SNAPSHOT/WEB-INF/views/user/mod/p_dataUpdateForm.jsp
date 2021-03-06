<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	if (session.getAttribute("emp_id") == null) {
		response.sendRedirect("goUserLogout");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="./resources/css/user.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function userUpdt() {
		var input_check = true;

		if ($("#emp_name").val() == '') {
			input_check = false;
			alert("이름은 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_dep").val() == '') {
			input_check = false;
			alert("부서는 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_grade").val() == '') {
			input_check = false;
			alert("직급은 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_tel").val() == '') {
			input_check = false;
			alert("전화번호는 필수 입력사항 입니다.");
			return;
		}

		if (input_check == true) {
			var formDataList = $("form[name=updtForm]").serialize();
			$.ajax({
				type : "POST",
				url : "userUpdt.daou",
				data : formDataList,
				async : false,
				success : function(data) {
					if (data == 'success') {
						alert("수정되었습니다.");
						location.href = "userMain.daou";
					} else {
						alert('수정 실패!');
					}
				},
				error : function(data) {
					alert('수정 실패!');
				}
			});
		} else {
			return;
		}
	}

	function backUserMain() {
		location.href = "userMain.daou";
	}
</script>
<style>
.table {
	width: 90%;
	padding: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
}

.btn {
	margin-right: 10px;
}

.btn_area {
	float: right;
	margin-top: 10px;
	margin-right: 10%;
}
</style>
</head>
<body>

	<div class="row content">
		<div class="content-header">
			<h4 style="color: #fff">Home</h4>
			<hr>

		</div>
		<div class="content-body">
			<h2>
				<span class="body-font"><%=session.getAttribute("emp_id")%>님
					환영합니다!</span>
			</h2>
			<h5></h5>
			<h4>
				<span class="body-font">풀어다우 서비스 메뉴 입니다.</span>
			</h4>
			<form id="updtForm" name="updtForm" method="post" class="form-body">
				<table class="table">
					<thead></thead>
					<tbody>
						<tr>
							<th scope="row">사번</th>
							<td><input type="hidden" id="emp_id" name="emp_id"
								value="${memberView.emp_id}" class="form-control"> <label>${memberView.emp_id}</label>
							</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td><input type="text" id="emp_name"
								value="${memberView.emp_name}" name="emp_name" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">부서</th>
							<td><select id="emp_dep" name="emp_dep" class="form-control">
									<c:forEach var="item" items="${deptList}">
											<option value="${item.quiz_cfg_code}"
												<c:if test="${memberView.emp_dept == item.quiz_cfg_code}"> selected </c:if>>${item.quiz_cfg_code_name}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th scope="row">직급</th>
							<td><select id="emp_grade" name="emp_grade" class="form-control">
									<c:forEach var="item" items="${gradeList}">
											<option value="${item.quiz_cfg_code}"
												<c:if test="${memberView.emp_grade == item.quiz_cfg_code}"> selected </c:if>>${item.quiz_cfg_code_name}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th scope="row">전화전호</th>
							<td><input type="text" id="emp_tel"
								value="${memberView.emp_tel}" name="emp_tel" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" id="emp_pw"
								value="${memberView.emp_pw}" name="emp_pw" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인</th>
							<td><input type="password" id="emp_pw_check" name="emp_pw_check"
								class="form-control"></td>
						</tr>
					</tbody>
				</table>
				<div class="btn_area">
					<button type="button" class="btn btn-default" onclick="userUpdt();">수정</button>
					<input type="button" class="btn btn-default" value="취소"
						onclick="backUserMain();">
				</div>
			</form>
		</div>
	</div>
	<div>
		<footer class="container-fluid">
			<p>개인정보처리방침 | 개인정보무단수집거부 | 이메일주소무단수집거부 | 윤리경영우)16878 경기도 용인시 수지구
				디지털벨리로 81 다우디지털스퀘어 6층 대표전화 : 070-8707-1000 사업자등록번호 : 220-81-02810
				대표이사: 김윤덕ⓒ 2018 DAOU Tech., INC. All rights reserved.</p>
			<p>다우기술 인턴 과제 : 풀어다우</p>
		</footer>
	</div>

</body>
</html>