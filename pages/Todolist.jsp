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

</head>
<!-- google webfont -->
<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />

<!-- CSS -->
	<!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"> -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form-elements.css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" >

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
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/pages/Cal.jsp">Calendar</a>
						</li>
						<li class="nav-item active">
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
	<!-- Top content -->
	<div class="top-content">

		<div class="">
			<div class="container">

				<div class="row justify-content-center">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1 style="text-align: center;">
							<strong>TDL</strong> To Do List
						</h1>
						<div class="description">
							<div class='input-group date' id='datetimepicker1' style="text-align: center; display: inline-block;">
								<html:form action="/tasklist" method="post" styleId="picker1">
									<input type='text' class="form-control" id="inputdate" value="${targetdate}" />
									<input type="hidden" value="${user.uid}">
								</html:form>
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>

						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-5">

						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Insert a Task</strong></h3>
									<p>タスクを入力してください。</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-pencil"></i>
								</div>
							</div>
							<div class="form-bottom">
								<form role="form" action="/taskinsert" method="post"
									class="login-form">
									<!-- title -->
									<div class="form-group">
										<label class="sr-only" for="tasktitle">title</label>
										<input type="text" name="tasktitle" placeholder="Title" class="form-username form-control" id="tasktitle" value="${update.tasktitle}">
									</div>
									<!-- date -->
									<div class="form-group">
										<label class="sr-only" for="taskdate">taskdate</label>
										<!-- datepicker -->
										<div class='input-group date' id='datetimepicker2'>
											<input type='text' class="form-control" id="insertdateinput" value="${targetdate }" />
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
									<!-- contents -->
									<div class="form-group">
										<label class="sr-only" for="taskcontents">contents</label>
										<textarea name="taskcontents" placeholder="contents"
											class="form-password form-control" id="taskcontents">${update.taskcontents}</textarea>
									</div>
									<logic:empty name="update">
										<button type="button" class="btn" onclick="insertTask()">Insert</button>
									</logic:empty>
									<logic:notEmpty name="update">
										<input type="hidden" value="${update.tid}" id="updatetid">
										<button type="button" class="btn" onclick="updateTask()">Update</button>
									</logic:notEmpty>
								</form>
							</div>
						</div>

					</div>

					<div class="col-md-1 middle-border"></div>
					<div class="col-md-1"></div>

					<div class="col-md-5">

						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Today's To Do List</strong></h3>
									<p>タスクリスト</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-sticky-note-o"></i>
								</div>
							</div>
							<div class="form-bottom">
								<logic:empty name="tasklist">
									<div class="form-group">
										<h4>タスクがありません</h4>
									</div>
								</logic:empty>
								<logic:notEmpty name="tasklist">
									<logic:iterate id="t" name="tasklist">
										<div class="row">
											<div class="col-md-7">
												<logic:equal name="t" property="taskstatus" value="0">
													<input type="checkbox" onclick="completeSwitch(this, '${t.tid}')">
													<label id="${t.tid}"><bean:write name="t" property="tasktitle" /></label>
												</logic:equal>
												<logic:equal name="t" property="taskstatus" value="1">
													<input type="checkbox" onclick="completeSwitch(this, '${t.tid}')" checked="checked">
													<label id="${t.tid}" style="text-decoration: line-through;">
														<bean:write name="t" property="tasktitle" />
													</label>
												</logic:equal>
											</div>
											<div class="col-md-5" >
												<div class="btns">
													<a href="#" onclick="deleteTask('${t.tid}')" class="badge badge-danger">delete</a>
													<a href="#" onclick="selectTask('${t.tid}','${t.taskdate}')" class="badge badge-success">modify</a>
												</div>
											</div>
										</div>
									</logic:iterate>
								</logic:notEmpty>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
</div>
	<!-- Footer -->
        <footer>
        	<div class="container">
        		<div class="row justify-content-center">

        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
						<div style="margin: 0 auto;">
							<html:form action="/diarylist" styleId="toggleform"></html:form>
							<br>
	        				<label class="switch">
							  <input type="checkbox" onchange="pageSwitch()" >
							  <span class="slider round" ></span>
							</label>
						</div>
        			</div>

        		</div>
        	</div>
        </footer>

	<!-- jquery with ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- date picker -->
	<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>

	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- back ground -->
<%-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.0.4/jquery.backstretch.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script> --%>

<script type="text/javascript">
/* page date picker */
$(function(){
     $('#datetimepicker1').datetimepicker({
		timepicker:false,
		format : "yyyy-MM-dd",
		startDate: new Date("${targetdate}"),
		onSelectDate:function(ct,$i){
				var thedate = dateFormat(ct);
				$("#inputdate").val(thedate);
				$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
			    $("#picker1").submit();
		}
     });
 });

/* insert form date picker */
 $(function(){
     $('#datetimepicker2').datetimepicker({
		timepicker:false,
		format : "yyyy-MM-dd",
		startDate: new Date("${targetdate}"),
		onSelectDate:function(ct,$i){
				var thedate = dateFormat(ct);
				$("#insertdateinput").val(thedate);
		}
     });
 });

/* list reload */
function getlist(){
	$.ajax({
		type : "post",
		url : "../tasklist.do",
		cache : false,
		data : {
			user : "${user}",
			thedate : $("#inputdate").val()
		},
		dataType: 'json',
		success : function(response) {
		}
	});
}

/* task insert */
function insertTask(){
	$.ajax({
		type : "post",
		url : "../taskinsert.do",
		cache : false,
		dataType : "text",
		data : {
			user : "${user}",
			tasktitle : encodeURIComponent($("#tasktitle").val()),
			taskdate : $("#insertdateinput").val(),
			taskcontents : encodeURIComponent($("#taskcontents").val())
		},
		success : function(response) {
			var thedate = $("#insertdateinput").val();
			$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
		    $("#picker1").submit();
		}
	});
}

/* task complete */
function completeSwitch(cb, tid){
	if (cb.checked) {
		$("#"+tid+"").css("text-decoration", "line-through");
		$.ajax({
			type : "post",
			url : "../taskcomplete.do",
			cache : false,
			data : {
				taskstatus : 1,
				taskid : tid
			},
			dataType: 'json',
			success : function(response) {
				var thedate = $("#inputdate").val();
				$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
			    $("#picker1").submit();
			}
		});
	}else {
		$("#"+tid+"").css("text-decoration", "none");
		$.ajax({
			type : "post",
			url : "../taskcomplete.do",
			cache : false,
			data : {
				taskstatus : 0,
				taskid : tid
			},
			dataType: 'json',
			success : function(response) {
				var thedate = $("#inputdate").val();
				$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
			    $("#picker1").submit();
			}
		});
	}
}

/* task delete */
function deleteTask(tid){
	$.ajax({
		type : "post",
		url : "../taskdelete.do",
		cache : false,
		data : {
			user : "${user}",
			taskid : tid
		},
		dataType: 'json',
		success : function(response) {
			var thedate = $("#inputdate").val();
			$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
		    $("#picker1").submit();
		},
	});
}

function selectTask(tid, taskdate){
	$.ajax({
		type : "post",
		url : "../taskselect.do",
		cache : false,
		data : {
			taskid : tid
		},
		dataType: 'json',
		success : function(response) {
			$('#picker1').append('<input type="hidden" name="thedate" value="'+taskdate+'" />');
		    $("#picker1").submit();
		}
	});
}

/* task update */
function updateTask(){
	$.ajax({
		type : "post",
		url : "../taskupdate.do",
		cache : false,
		dataType : "text",
		data : {
			user : "${user}",
			tasktitle : encodeURIComponent($("#tasktitle").val()),
			taskdate : $("#insertdateinput").val(),
			taskcontents : encodeURIComponent($("#taskcontents").val()),
			tasktid : $("#updatetid").val()
		},
		success : function(response) {
			var thedate = $("#insertdateinput").val();
			$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
		    $("#picker1").submit();
		}
	});
}


function pageSwitch(){
	var thedate = $("#inputdate").val();
	$('#toggleform').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
	$("#toggleform").submit();
}


/* string date to numeric date formatter */
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