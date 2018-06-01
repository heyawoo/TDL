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
<!-- google webfont -->
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />

<!-- jquery with ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" >
<!-- google webfont -->
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
<style type="text/css">
	body {
    font-family: 'Rounded Mplus 1c', sans-serif;
    font-size: 14px;
  }
</style>
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

	<!-- space -->
	<div class="row">
	</div>
<br><br><br><br><br><br>
	<!-- cover -->
	<div class="row align-items-center">
		<!-- space -->
		<div class="col-sm-1">
		</div>
		<!-- main -->
		<div class="col align-self-center">
			<div class="jumbotron">
			<img src="${pageContext.request.contextPath}/icon/007-umbrella.png" width="50" height="50" class="d-inline-block align-top" alt="">
				<h1 class="display-4">Hello!</h1>
				<p class="lead">This is a simple to do list, web application.</p>
				<hr class="my-4">
				<p>Let's start a day with TDL!</p>
				<a class="btn btn-success btn-lg" href="./Login.jsp" role="button">START</a>
				<logic:present property="uid" name="user">
				<a class="btn btn-info btn-lg" href="../logout.do" role="button">LOGOUT</a>
				</logic:present>
			</div>
		</div>
		<!-- space -->
		<div class="col-sm-1">
		</div>
	</div>

	<!-- space -->
	<div class="row">
	</div>

</div><!-- //container -->


        <%--   <div role="main" class="inner cover">
            <h1 class="cover-heading">To Do List</h1>
            <p class="lead">Make Your Dayplan with TDL!</p>
            <html:form action="/main" method="post">
            <p class="lead">
              <html:submit property="btn" value="ENTER" styleClass="btn btn-lg btn-secondary"/>
              <logic:present property="uid" name="user">
              <html:submit property="btn" value="LOGOUT" styleClass="btn btn-lg btn-secondary"/>
              </logic:present>
            </p>
            </html:form>
          </div> --%>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" ></script>
</body>
</html>