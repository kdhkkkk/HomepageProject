<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.16.1/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.3.0/vue.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.4.1/css/bulma.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="js/bootstrap.js"></script>

<script type="text/javascript">
	function registerCheckFuntion() {

		var userID = $('#studentNo').val();

		$.ajax({

			type : 'POST',

			url : './UserRegisterCheckServlet',

			//파리미터 변수 이름 : 값

			data : {
				Student_Number : Student_Number
			},

			success : function(result) {

				if (result == 1) {

					$('#checkMessage').html('유효한 학번입니다.');

					$('#checkType')
							.attr('class', 'modal-content panel-success');

					alert('asd');

				} else {

					$('#checkMessage').html('유효한 학번입니다.');

					$('#checkType')
							.attr('class', 'modal-content panel-warning');

				}

				$('#checkModal').modal("show");

			}

		})

	}

	function passwordCheckFunction() {

		var userPassword1 = $('#userPassword1').val();

		var userPassword2 = $('#userPassword2').val();

		if (userPassword1 != userPassword2) {

			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');

		} else {

			$('#passwordCheckMessage').html('');

		}

	}
</script>

<title>회원가입</title>

</head>
<title>Button Test</title>
<style>
#test_btn1 {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
}

#test_btn2 {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
}

#btn_group button {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}

#btn_group button:hover {
	color: white;
	background-color: skyblue;
}
</style>


<body>

	<div class="container">

		<form method="post" action="Signup_insert.jsp">

			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #dddddd";>

				<thead>

					<tr>

						<th colspan="3"><h4 style="text-align: center">회원 등록 양식</h4>
					</tr>

				</thead>

				<tbody>



					<tr>

						<td style="width: 110px;"><h5>비밀번호</h5>
						<td colspan="2"><input class="form-control" type="password"
							onkeyup="passwordCheckFunction()" ; id="userPassword1"
							name="userpassword" maxlength="20" required="required"
							placeholder="비밀번호를 입력해주세요."></td>



					</tr>

					<tr>

						<td style="width: 120px;"><h5>비밀번호 확인</h5>
						<td colspan="2"><input class="form-control" type="password"
							onkeyup="passwordCheckFunction()" ; id="userPassword2"
							name="userPassword2" maxlength="20" required="required"
							placeholder="비밀번호 확인을 입력해주세요."></td>

					</tr>

					<tr>

						<td style="width: 110px;"><h5>이름</h5>
						<td colspan="2"><input class="form-control" type="text"
							id="userName" name="username" maxlength="20" required="required"
							placeholder="이름을 입력해주세요."></td>

					</tr>

				<tr>

                  <td style="width: 110px;"><h5>휴대폰 번호</h5>
                  <td colspan="2"><input class="form-control" type="number"
                     id="phonenumber" name="userphone" maxlength="20" required="required"
                     placeholder="휴대폰 번호를 입력해주세요."></td>

               </tr>

					<tr>

						<td style="text-align: right" colspan="3">
							<div id="btn_group">
							<button type="submit" id="test_btn2" >회원가입</button>
						</span>

						</td>

					</tr>

				</tbody>

			</table>

		</form>

	</div>

	<%
		String messageContent = null;

	if (session.getAttribute("messageContent") != null) {

		messageContent = (String) session.getAttribute("messageContent");

	}

	String messageType = null;

	if (session.getAttribute("messageType") != null) {

		messageType = (String) session.getAttribute("messageType");

	}

	if (messageContent != null) {
	%>

	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">

		<div class="vertical-alignment-helper">

			<div class="modal-dialog vertical-align-center">

				<div class="modal-content"
					<%if (messageType.equals("오류메세지"))
	out.println("panel-warning");
else
	out.println("panel-success");%>>

					<div class="modal-header panel-heading">

						<button type="button" class="close" data-dismiss="modal">

							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>

						</button>

						<h4 class="modal-title">

							<%=messageType%>

						</h4>

					</div>

					<div class="modal-body">

						<%=messageContent%>

					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>

					</div>

				</div>

			</div>

		</div>

	</div>

	<script>
		$('#messageModal').modal('show');
	</script>

	<%
		session.removeAttribute("messageContent");

	session.removeAttribute("messageType");

	}
	%>

	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog"
		aria-hidden="true">

		<div class="vertical-alignment-helper">

			<div class="modal-dialog vertical-align-center">

				<div id="checkType" class="modal-content panel-info">

					<div class="modal-header panel-heading">

						<button type="button" class="close" data-dismiss="modal">

							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>

						</button>

						<h4 class="modal-title">확인메세지</h4>

					</div>

					<div class="modal-body" id="checkMessage"></div>

					<div class="modal-footer">

						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>

</html>