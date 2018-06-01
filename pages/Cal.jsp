<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
<head>
<title>calendar test</title>
<!-- google webfont -->
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />

<!-- jquery with ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

<link href='${pageContext.request.contextPath}/fullcalendar-3.9.0/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/fullcalendar-3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />

<style>

  body {
    font-family: 'Rounded Mplus 1c', sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>
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
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/pages/Main.jsp" >Home<span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item active">
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

          <div role="main" class="inner cover">
          <br><br>
  			<div id='calendar'></div>
          </div>
          <html:form action="/tasklist" method="post" styleId="calform">
          <html:hidden property="userid" value="${user.uid}"/>
          </html:form>
<%-- 	<html:form action="/cal" styleId="calform">
		<html:hidden property="thedate" styleId="thedate"/>
	</html:form>
 --%>
    </div>
<script src='${pageContext.request.contextPath}/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/fullcalendar-3.9.0/fullcalendar.min.js'></script>
<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
    	defaultview: 'month',
		header: {
		    left: 'prev',
		    center: 'title',
		    right: 'next'
		  },
		footer:{right: 'today'},
		defaultDate: new Date(),
		navLinks: false, // can click day/week names to navigate views
		selectable: true,
		selectHelper: true,
		select: function(start){
			var thedate = dateFormat(start);
			$('#calform').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
		    $("#calform").submit();
    	}
    });

  });
	function dateFormat(str){
		var thedate = str.toString().substring(4, 15);
		var year, month, day;
		var dates = thedate.split(" ");
		month = dates[0];
		day = dates[1];
		year = dates[2];

		switch (dates[0]) {
        case "Jan":  month = "0"+1;
                 break;
        case "Feb":  month = "0"+2;
                 break;
        case "Mar":  month = "0"+3;
                 break;
        case "Apr":  month = "0"+4;
                 break;
        case "May":  month = "0"+5;
                 break;
        case "Jun":  month = "0"+6;
                 break;
        case "Jul":  month = "0"+7;
                 break;
        case "Aug":  month = "0"+8;
                 break;
        case "Sep":  month = "0"+9;
                 break;
        case "Oct": month = 10+"";
                 break;
        case "Nov": month = 11+"";
                 break;
        case "Dec": month = 12+"";
                 break;
		default:
			break;
		}
		return year+"-"+month+"-"+day;
	}

</script>
</body>
</html>