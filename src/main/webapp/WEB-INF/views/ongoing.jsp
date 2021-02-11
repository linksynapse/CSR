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
     <li class="nav-item">
        <a class="nav-link" href="logout">Logout <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
</nav>

<div class="nav-scroller bg-white shadow-sm">
  <nav class="nav nav-underline">
    <a class="nav-link" href="bad097494597a4e092c1524102eeaea7">Unassigned</a>
    <a class="nav-link active" href="5fd9a718e5c073bb745cd970a6f1a5f3">On Going</a>
    <a class="nav-link" href="d9a22d7a8178d5b42a8750123cbfe5b1">Complete</a>
    <a class="nav-link" href="219d770572d00a227dc481a3bdb2c51e">Escalated</a>
    <a class="nav-link" href="99991d972ad820b1d2f398e7a160eb03">Out Of Scope</a>
  </nav>
</div>

<main role="main" class="mr-2 ml-2">
  <div class="d-flex align-items-center p-3 my-3 rounded shadow-sm">
    <img class="mr-3" src="assets/image/logo.png" alt="" width="48" height="48">
    <div class="lh-100">
      <h6 class="mb-0 lh-100" style="color:black">On Going</h6>
    </div>
  </div>

  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <table class="table" id="dt">
      <thead>
      	<tr>
	        <th style="width: 16%; text-align: left;">Case ID</th>
	        <th style="width: 8%; text-align: left;">Environment</th>
	        <th style="width: 68%; text-align: center;">Description</th>
	        <th style="width: 8%; text-align: left;">Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${display}" varStatus="status">
			<tr>
				<td>${item.getCaseID()}</td>
          		<td>${item.getEnvironment()}</td>
          		<td>${item.getDescription()}</td>
          		<td><button class="btn btn-primary" onClick="javascript:Detail('${item.getCaseID()}')">Detail</button></td>
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
<script>
eval(function(p,a,c,k,e,r){e=function(c){return c.toString(a)};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('$(3).9(4(){$(\'#a\').b({})});4 c(5){6 0=3.7("0");0.1("d","e");0.1("f","./g");6 2=3.7("h");2.1("i","j");2.1("k","l");2.1("m",5);0.8(2);3.n.8(0);0.o()}',25,25,'form|setAttribute|hiddenField|document|function|caseid|var|createElement|appendChild|ready|dt|DataTable|Detail|method|GET|action|detail|input|type|hidden|name|CaseID|value|body|submit'.split('|'),0,{}))
</script>
</body>
</html>
