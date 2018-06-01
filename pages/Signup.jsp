<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>TDL</title>
<!-- jquery with ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- google webfont -->
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
<!-- bootstrap CSS -->
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<!-- login css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/login.css">
</head>
<body class="text-center">
<div class="container-fluid">
<!-- nav -->
	<div class="row justify-content-between">
		<!-- home logo -->
		<div class="col-2">
			<!-- Image and text -->
			<nav class="navbar navbar-light">
			  <a class="navbar-brand" href="#">
			    <img src="${pageContext.request.contextPath}/icon/012-sun.png" width="30" height="30" class="d-inline-block align-top" alt="">
			    TDL
			  </a>
			</nav>
		</div>
		<!-- space -->
		<div class="col-5" >
		</div>
		<!-- nav bar -->
		<div class="col d-flex justify-content-end">
			<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
				<!-- Navbar content -->
				<div class="d-flex justify-content-end" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item active">
							<a class="nav-link" href="${pageContext.request.contextPath}/pages/Main.jsp" >Home<span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/pages/Cal.jsp">Calendar</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="../tasklist.do" >ToDoList</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="../diarylist.do" >Diary</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

<div class="row">
</div>
<br><br><br><br><br>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col">

       <div class="form-login">
            	<h3>Sign up</h3>
				<html:errors />
            <html:form action="/signup" styleId="signupform" styleClass="form-horizontal">
			  <fieldset>
			    <div id="legend">
			      <legend class="">Register</legend>
			    </div>
			    <div class="control-group">
			      <!-- Username -->
			      <label class="control-label"  for="userid">ID</label>
			      <div class="controls">
			      <logic:present name="idcheckflag">
				      <logic:equal value="0" name="idcheckflag">
				      	<html:text value="${checkedid }" property="userid" styleId="userid" styleClass="form-control input-sm chat-input" disabled="disabled"/>
				      this is available
				      </logic:equal>
			      <logic:equal value="1" name="idcheckflag">
			        <html:text value="${checkedid }" styleId="userid" property="userid" styleClass="form-control input-sm chat-input" />
			      	ID is already exist
			      </logic:equal>
			      </logic:present>
			      <logic:notPresent name="idcheckflag">
			        <html:text value="${newuser.userid }" styleId="userid" property="userid" styleClass="form-control input-sm chat-input" />
			      Please check the ID
			      </logic:notPresent>
			        <input type="hidden" id="idcheckflag" name="idcheckflag" value="${idcheckflag}"/>
			        <html:form action="/signupcheck" styleId="flagform">
			        </html:form>
			      </div>
			    </div>

			    <div class="control-group">
			      <!-- Password-->
			      <label class="control-label" for="userpw">Password</label>
			      <div class="controls">
			        <html:password value="${newuser.userpw }" styleId="userpw" property="userpw" styleClass="form-control input-sm chat-input"/>
			      </div>
			    </div>

			    <div class="control-group">
			      <!-- Password -->
			      <label class="control-label"  for="userpw2">Password (Confirm)</label>
			      <div class="controls">
			        <input type="password" id="userpw2" name="userpw2" class="form-control input-sm chat-input"/>
			      </div>
			    </div>

			    <div class="control-group">
			      <!-- E-mail -->
			      <label class="control-label" for="username">Name</label>
			      <div class="controls">
			        <html:text value="${newuser.username }" styleId="username" property="username" styleClass="form-control input-sm chat-input" />
			      </div>
			    </div>

			    <div class="control-group">
			      <!-- E-mail -->
			      <label class="control-label" for="useremail">E-mail</label>
			      <div class="controls">
			        <html:text value="${newuser.useremail }" styleId="useremail" property="useremail" styleClass="form-control input-sm chat-input" />
			      </div>
			    </div>

			      <!-- Button -->
			      <div class="">
			      <br>
			        <html:button onclick="validateForm()" property="gobtn" value="Sign up" styleClass="btn btn-primary btn-md" ><i class="fa fa-sign-in"></i></html:button>
			      </div>
			  </fieldset>
            </html:form>
      </div>
      </div>
	<div class="col-md-3"></div>
</div>
<div class="row">
</div>

</div><!-- container end -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- javascript -->
	<script type="text/javascript">
	$(function() {
	    $("#userid").attr("placeholder", "IDを入力してください。");
	    $("#userpw").attr("placeholder", "パスワードを入力してください。");
	    $("#userpw2").attr("placeholder", "パスワードを再度入力してください。");
	    $("#username").attr("placeholder", "名前を入力してください。");
	    $("#useremail").attr("placeholder", "メールアドレスを入力してください。");
	    if ($("#hiddenerror").val()) {
	    	swal("Error!", "「ログインIDとパスワードが間違っています。」", "error");
		}
	});
	    function validateForm() {
	        var userid = $("#userid").val();
	        var flag = $("#idcheckflag").val();
	        var userpw = $("#userpw").val();
	        var userpw2 = $("#userpw2").val();
	        var username = $("#username").val();
	        var useremail = $("#useremail").val();

	        if (!userid) {
	        	swal("Error!", "「IDは必須項目です。」", "error");
	        	return;
			} else if (!flag) {
	        	swal("Error!", "「IDチェックをしてください。」", "error");
	        	return;
			}
	        if (flag === "1") {
	        	swal("Error!", "「IDが既に存在しています」", "error");
	        	return;
			}
			if (!userpw || !userpw2) {
				swal("Error!", "「パスワードは必須項目です。」", "error");
				return;
			} else if (userpw != userpw2) {
				swal("Error!", "「パスワードが間違っています。」", "error");
				return;
			}
			if (!username) {
				swal("Error!", "「名前は必須項目です。」", "error");
				return;
			}
			if (!useremail) {
				swal("Error!", "「メールアドレスは必須項目です。」", "error");
				return;
			} else if (!useremail.includes('@')) {
				swal("Error!", "「メールアドレスをもう一度確認してください。」", "error");
				return;
			}

			swal("Success!", "「ユーザ登録に成功しました。」", "success");
			setTimeout(function() {
				$("#signupform").submit();
	    	}, 1350);
		}

	    $('#userid').change(function() {
	    	var userid = $("#userid").val();
	    	$.ajax({
	    		type : "post",
	    		url : "../signupcheck.do",
	    		cache : false,
	    		async : false,
	    		data : {
	    			userid : userid,
	    		},
	    		dataType: 'json',
	    		success : function(response) {
	    		},
	    		complete : function(){
	    			window.location.reload(true);
	    		}
	    	});
	    });
	</script>
</body>
</html>
