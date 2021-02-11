<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>Bluzen CSR</title>

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    .table.dataTable  {
	    font-family: Verdana, Geneva, Tahoma, sans-serif;
	    font-size: 10px;
    }
    </style>
    <!-- Custom styles for this template -->
    <link href="assets/css/offcanvas.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
  <a class="navbar-brand mr-auto mr-lg-0" href="#">BLUZEN CSR</a>
  <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="bad097494597a4e092c1524102eeaea7">Dashboard <span class="sr-only">(current)</span></a>
      </li>
      <c:set var = "Level" value = "${Security}"/>
          <c:if test = "${Level < 1}">
          <li class="nav-item">
        <a class="nav-link" href="manage">History <span class="sr-only">(current)</span></a>
      </li>
     </c:if>
    </ul>
  </div>
</nav>

<div class="nav-scroller bg-white shadow-sm">
  <nav class="nav nav-underline">
    <a class="nav-link" href="bad097494597a4e092c1524102eeaea7">Unassigned</a>
    <a class="nav-link" href="5fd9a718e5c073bb745cd970a6f1a5f3">On Going</a>
    <a class="nav-link" href="d9a22d7a8178d5b42a8750123cbfe5b1">Complete</a>
    <a class="nav-link" href="219d770572d00a227dc481a3bdb2c51e">Escalated</a>
    <a class="nav-link" href="99991d972ad820b1d2f398e7a160eb03">Out Of Scope</a>
  </nav>
</div>

<main role="main" class="mr-2 ml-2">
  <div class="d-flex align-items-center p-3 my-3 rounded shadow-sm">
    <img class="mr-3" src="assets/image/logo.png" alt="" width="48" height="48">
    <div class="lh-100">
      <h6 class="mb-0 lh-100" style="color:black">History</h6>
    </div>
  </div>
<div class="row float-right align-items-center">
        <div class="input-group date w-25" id="datetimepicker7" data-target-input="nearest">
			<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7"/>
			<div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
				<div class="input-group-text"><i class="fa fa-calendar"></i></div>
        	</div>
        </div>
        <p class="w-10 mr-1 ml-1" style="margin:0px">TO</p>
        <div class="input-group date w-25 mr-2" id="datetimepicker8" data-target-input="nearest">
			<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8"/>
			<div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
				<div class="input-group-text"><i class="fa fa-calendar"></i></div>
			</div>
		</div>
	  	<input type="text" class="mr-1" id="searchText" placeholder="Country">
	  	<input type="button" class="mr-1" value="Search" OnClick="javascript:Search()">
	  </div>
  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <table class="table" id="dt" style="width:100%">
      <thead>
      	<tr>
	        <th>Case ID</th>
	        <th>Country</th>
	        <th>Name</th>
	        <th>Remote/On-Site</th>
	        <th>Customer Location</th>
	        <th>Call Center Employee Name</th>
	        <th>Inbound Call Start Time</th>
	        <th>Inbound Call End Time</th>
	        <th>On-Site Start Time</th>
	        <th>On-Site End Time</th>
	        <th>Status</th>
	        <th>Task Classification</th>
	        <th>Problem Description</th>
	        <th>Root Cause</th>
	        <th>Solution</th>
	        <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${display}" varStatus="status">
			<tr>
				<td>${item.getCaseId()}</td>
          		<td>${item.getCountry()}</td>
          		<td>${item.getName()}</td>
          		<td>${item.getContactType()}</td>
          		<td>${item.getAddress()}</td>
          		<td>${item.getEngineer()}</td>
          		<td>${item.getApplyStart()}</td>
          		<td>${item.getApplyEnd()}</td>
          		<td>${item.getOnSiteStart()}</td>
          		<td>${item.getOnSiteEnd()}</td>
          		<td>${item.getStatus()}</td>
          		<td>${item.getTaskClass()}</td>
          		<td>${item.getDescription()}</td>
          		<td>${item.getRootCause()}</td>
          		<td>${item.getSolution()}</td>
          		<td style="text-align:center"><button class="btn btn-primary m-1" onClick="javascript:Delete('${item.getCaseId()}')">Delete</button><br><button class="btn btn-primary" onClick="javascript:Detail('${item.getCaseId()}')">Detail</button></td>
			</tr>
		</c:forEach>
      </tbody>
    </table>
  </div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
<script src="assets/js/offcanvas.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.print.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<script>

function Search(){
	var location = "manage?Country=" + $('#searchText').val();
	location += "&Start=" + $('#datetimepicker7').datetimepicker("viewDate").format("YYYY-MM-DD HH:mm");
	location += "&End=" + $('#datetimepicker8').datetimepicker("viewDate").format("YYYY-MM-DD HH:mm");
	window.location.href = location;
}


$(document).ready(function(){
	$('#dt').DataTable({
		"bFilter": false,
		dom: 'Bfrtip',
	    buttons: [
	        'excel'
	    ]
	});
	
	$('#datetimepicker7').datetimepicker({
		useCurrent: false
	});
    $('#datetimepicker8').datetimepicker();
    $("#datetimepicker7").on("change.datetimepicker", function (e) {
        $('#datetimepicker8').datetimepicker('minDate', e.date);
    });
    $("#datetimepicker8").on("change.datetimepicker", function (e) {
        $('#datetimepicker7').datetimepicker('maxDate', e.date);
    });
});

function Delete(caseid){
	var form = document.createElement("form");
	form.setAttribute("method","GET");
	form.setAttribute("action","./delete");
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","CaseID");
	hiddenField.setAttribute("value",caseid);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	form.submit();
}

function Detail(caseid){
	var form = document.createElement("form");
	form.setAttribute("method","GET");
	form.setAttribute("action","./readonly");
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","CaseID");
	hiddenField.setAttribute("value",caseid);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	form.submit();
}
</script>
</body>
</html>
