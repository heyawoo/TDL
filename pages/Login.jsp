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
<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<!-- google webfont -->
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
<!-- login css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/login.css">
</head>

<body class="text-center" style="font-family: 'Rounded Mplus 1c', sans-serif;">
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
				<div class="" id="navbarNav">
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

<div class="row"></div>

        <br><br><br><br><br><br><br><br>
    <div class="row align-items-center">
        <div class="col-md-5"></div>
        <div class="col">
            <div class="form-login">
            	<h4><strong>Log in</strong></h4>
            	<logic:messagesPresent>
					<div class="errbox">
						<html:errors/>
					</div>
				</logic:messagesPresent>
            <html:form action="/login" styleId="loginform">
	            <html:text styleId="userid" property="userid" styleClass="form-control input-sm chat-input" maxlength="20" />
	            <br>
	            <html:password styleId="userpw" property="userpw" styleClass="form-control input-sm chat-input" maxlength="20"/>

	            <hr/>

	            <div class="wrapper">
	                <html:button onclick="location.href='${pageContext.request.contextPath}/pages/Signup.jsp'" property="gobtn" value="Sign up" styleClass="btn btn-secondary btn-md" ><i class="fa fa-sign-in"></i></html:button>
	                <html:button onclick="validateForm()" property="gobtn" value="Log in" styleClass="btn btn-success btn-md"><i class="fa fa-sign-in"></i></html:button>
	            </div>
            </html:form>
            </div>
        </div>
        <div class="col-md-5"></div>
    </div>
<div class="row"></div>

</div>

	<!-- javascript -->
	<script type="text/javascript">

	$(function() {
	    $("#userid").attr("placeholder", "ID");
	    $("#userpw").attr("placeholder", "password");
	    if ($("#hiddenerror").val()) {
	    	swal("Error!", "「ログインIDとパスワードが間違っています。」", "error");
		} else if ("${user.uid}") {
	    	swal("Great!", "ログインに成功しました。", "success");
	    	setTimeout(function() {
	    		location.href="${pageContext.request.contextPath}/pages/Cal.jsp";
	    	}, 1350);
		}
	});

	    function validateForm() {
	        var userid = $("#userid").val();
	        var userpw = $("#userpw").val();

	        if (!userid || !userpw) {
	        	swal("Error!", "「ログインIDとパスワードは必須項目です。」", "error");
			}else {
				$("#loginform").submit();
			}
	  }
	</script>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>