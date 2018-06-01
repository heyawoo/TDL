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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

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
						<li class="nav-item">
							<a class="nav-link" href="../tasklist.do" >ToDoList</a>
						</li>
						<li class="nav-item active">
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
							<strong>TDL</strong> Diary
						</h1>
						<div class="description">

							<div class='input-group date' id='datetimepicker1' style="text-align: center; display: inline-block;">
								<html:form action="/diarylist" method="post" styleId="picker1">
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

						<logic:notPresent name="diaryupdateflag">
						<logic:notEqual name="diary" property="did" value="0">
						<!-- read only -->
						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Diary</strong></h3>
									<p>今日の日記</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-pencil"></i>
								</div>
							</div>
							<div class="form-bottom">
								<form role="form" action="/diaryupdate" method="post" class="login-form">
									<!-- rate -->
									<div class="form-group">
										<label class="sr-only" for="diaryrate">diaryrate</label>
										<div id="rateYo1"></div>
									</div>
									<!-- title -->
									<div class="form-group">
										<label class="sr-only" for="diarytitle">title</label>
										<input type="text" name="diarytitle" placeholder="Title" class="form-username form-control" id="diarytitle" value="${diary.diarytitle}" disabled="disabled">
									</div>
									<!-- date -->
									<div class="form-group">
										<label class="sr-only" for="diarydate">diarydate</label>
										<!-- datepicker -->
										<div class='input-group date' id='datetimepicker2'>
											<input type='text' class="form-control" id="insertdateinput" value="${targetdate }" disabled="disabled" />
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
									<!-- contents -->
									<div class="form-group">
										<label class="sr-only" for="diarycontents">contents</label>
										<textarea name="diarycontents" placeholder="contents"
											class="form-password form-control" id="diarycontents" disabled="disabled">${diary.diarycontents}</textarea>
									</div>
										<input type="hidden" value="${diary.did}" id="updatetid">
										<button type="button" class="btn" onclick="selectDiary()">Update</button>
								</form>
							</div>
						</div><!-- //read only -->
						</logic:notEqual>

						<logic:equal name="diary" property="did" value="0">
							<!-- insert form box start -->
						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Write a Diary</strong></h3>
									<p>ダイアリーを入力してください。</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-pencil"></i>
								</div>
							</div>
							<div class="form-bottom">
								<form role="form" action="/diaryinsert" method="post" class="login-form">
									<!-- rate -->
									<div class="form-group">
										<label class="sr-only" for="diaryrate">diaryrate</label>
										<div id="rateYo2"></div>
									</div>
									<!-- title -->
									<div class="form-group">
										<label class="sr-only" for="diarytitle">title</label>
										<input type="text" name="diarytitle" placeholder="Title" class="form-username form-control" id="diarytitle" value="${diary.diarytitle}">
									</div>
									<!-- date -->
									<div class="form-group">
										<label class="sr-only" for="diarydate">diarydate</label>
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
										<label class="sr-only" for="diarycontents">contents</label>
										<textarea name="diarycontents" placeholder="contents"
											class="form-password form-control" id="diarycontents">${diary.diarycontents}</textarea>
									</div>
										<button type="button" class="btn" onclick="insertDiary()">Insert</button>
								</form>
							</div>
						</div><!-- //insert form box end -->
						</logic:equal>
						</logic:notPresent>

						<!-- update -->
						<logic:present name="diaryupdateflag">
							<!-- update form box start -->
						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Update a Diary</strong></h3>
									<p>ダイアリーを入力してください。</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-pencil"></i>
								</div>
							</div>
							<div class="form-bottom">
								<form role="form" action="/diaryinsert" method="post" class="login-form">
									<!-- rate -->
									<div class="form-group">
										<label class="sr-only" for="diaryrate">diaryrate</label>
										<div id="rateYo2"></div>
									</div>
									<!-- title -->
									<div class="form-group">
										<label class="sr-only" for="diarytitle">title</label>
										<input type="text" name="diarytitle" placeholder="Title" class="form-username form-control" id="diarytitle" value="${diary.diarytitle}">
									</div>
									<!-- date -->
									<div class="form-group">
										<label class="sr-only" for="diarydate">diarydate</label>
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
										<label class="sr-only" for="diarycontents">contents</label>
										<textarea name="diarycontents" placeholder="contents"
											class="form-password form-control" id="diarycontents">${diary.diarycontents}</textarea>
									</div>
										<input type="hidden" value="${diary.did}" id="updatetid">
										<button type="button" class="btn" onclick="updateDiary()">Update</button>
								</form>
							</div>
						</div><!-- //update form box end -->
						</logic:present>

					</div>

					<div class="col-md-1 middle-border"></div>
					<div class="col-md-1"></div>

					<div class="col-md-5">

						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Complete List</strong></h3>
									<p>完了タスクリスト</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-sticky-note-o"></i>
								</div>
							</div>
							<div class="form-bottom">
								<logic:empty name="completelist">
									<div class="form-group">
										<h4>完了したタスクがありません</h4>
									</div>
								</logic:empty>
								<logic:notEmpty name="completelist">
									<logic:iterate id="t" name="completelist">
										<div class="row">
											<div class="col-md-9">
												<label id="${t.tid}"><bean:write name="t" property="tasktitle" /></label>
											</div>
											<div class="col-md-2" >
												<div class="btns">
													<a href="#" onclick="selectTask('${t.tasktitle}', '${t.taskcontents}')" class="badge badge-info">more</a>
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
        		<div class="row  justify-content-center">

        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				<div style="margin: 0 auto;">
						<html:form action="/tasklist" styleId="toggleform"></html:form>
	        				<br>
	        				<label class="switch">
							  <input type="checkbox" checked onchange="pageSwitch()">
							  <span class="slider round"></span>
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

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

	<!-- back ground -->
<%-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.0.4/jquery.backstretch.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script> --%>

	<!-- alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">

/* rating star */
$(function () {
	if ("${diary.did}" !== 0) {
		$("#rateYo1").rateYo({
			numStars: "${diary.diaryrate}",
			maxValue: "${diary.diaryrate}",
			rating: "${diary.diaryrate}",
		    readOnly: true
		  });
		if ("${diaryupdateflag}" != null) {
			$("#rateYo2").rateYo({
			    rating: "${diary.diaryrate}",
			    fullStar: true
			  });
		}
	} else {

		  $("#rateYo2").rateYo({
		    rating: 0,
		    fullStar: true
		  });
	}
});


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
		url : "../diarylist.do",
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

/* diary insert */
function insertDiary(){
	var rate = $("#rateYo2").rateYo("rating");
	$.ajax({
		type : "post",
		url : "../diaryinsert.do",
		cache : false,
		dataType : "text",
		data : {
			user : "${user}",
			diarytitle : encodeURIComponent($("#diarytitle").val()),
			diarydate : $("#insertdateinput").val(),
			diaryrate : rate,
			diarycontents : encodeURIComponent($("#diarycontents").val())
		},
		success : function(response) {
			var thedate = $("#insertdateinput").val();
			$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
		    $("#picker1").submit();
		}
	});
}

function selectDiary(diaryid){
	$.ajax({
		type : "post",
		url : "../diaryselect.do",
		cache : false,
		data : {
			updatediaryid : "${update.did}"
		},
		dataType: 'json',
		success : function(response) {
			var thedate = $("#inputdate").val();
			$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
		    $("#picker1").submit();
		}
	});
}

/* task update */
function updateDiary(){
	var rate = $("#rateYo2").rateYo("rating");
	$.ajax({
		type : "post",
		url : "../diaryselect.do",
		cache : false,
		dataType : "text",
		data : {
			user : "${user}",
			diarytitle : encodeURIComponent($("#diarytitle").val()),
			diarydate : $("#insertdateinput").val(),
			diaryrate : rate,
			diarycontents : encodeURIComponent($("#diarycontents").val()),
			did : $("#updatetid").val()
		},
		success : function(response) {
			var thedate = $("#insertdateinput").val();
			$('#picker1').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
		    $("#picker1").submit();
		}
	});
}

/* toggle button switch */
function pageSwitch(){
	var thedate = $("#inputdate").val();
	$('#toggleform').append('<input type="hidden" name="thedate" value="'+thedate+'" />');
	$("#toggleform").submit();
}

/* more infomation alert of completed task */
function selectTask(tasktitle, taskcontents){
	swal({
		  title: tasktitle,
		  text: taskcontents,
		  icon: "info",
		});
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