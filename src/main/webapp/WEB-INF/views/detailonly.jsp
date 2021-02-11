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

<main role="main" class="mr-2 ml-2">
  <div class="d-flex align-items-center p-3 my-3 rounded shadow-sm">
    <img class="mr-3" src="assets/image/logo.png" alt="" width="48" height="48">
    <div class="lh-100">
      <h6 class="mb-0 lh-100" style="color:black">Detail view report</h6>
      <small style="color:black">${Items.getApplyDateTime()}</small>
    </div>
  </div>

  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <div class="row">
    	<div class="col-md-4 mb-3">
			<label for="firstName">Name</label>
			<input type="text" class="form-control" id="Name" name="Name" placeholder="" value="${Items.getName()}" readonly>
		</div>
		
		<div class="col-md-4 mb-3">
			<label for="firstName">Telephone</label>
			<input type="text" class="form-control" id="Tel" name="Tel" placeholder="" value="${Items.getTelephone()}" readonly>
		</div>
		
		<div class="col-md-4 mb-3">
			<label for="firstName">Email</label>
			<input type="text" class="form-control" id="Email" name="Email" placeholder="" value="${Items.getEmail()}" readonly>
		</div>
    </div>
    <div class="row">
    	<div class="col-md-4 mb-3">
			<label for="firstName">Environment</label>
			<input type="text" class="form-control" id="Environment" name="Environment" placeholder="" value="${Items.getEnvironment()}" readonly>
		</div>
		
		<div class="col-md-4 mb-3">
			<label for="firstName">Country</label>
			<input type="text" class="form-control" id="Country" name="Country" placeholder="" value="${Items.getCountry()}" readonly>
		</div>
		
		<div class="col-md-4 mb-3">
			<label for="firstName">CaseID</label>
			<input type="text" class="form-control" id="CaseID" name="CaseID" placeholder="" value="${Items.getCaseID()}" readonly>
		</div>
    </div>
    <div class="row">
    	<div class="col-md-8 mb-3">
			<label for="firstName">Address</label>
			<input type="text" class="form-control" id="Address" name="Address" placeholder="" value="${Items.getAddress()}" readonly>
		</div>
		
		<div class="col-md-4 mb-3">
			<label for="firstName">Status</label>
			<input type="text" class="form-control" id="Status" name="Status" placeholder="" value="${Items.getStatus()}" readonly>
		</div>
    </div>
    <div class="row">
    	<div class="col-md-12 mb-3">
			<label for="Describe">Customer problem describe</label>
	    	<textarea class="form-control" id="Describe" name="Describe" rows="5" readonly>${Items.getDescription()}</textarea>
		</div>
    </div>
    
    <div class="row">
    	<c:forEach var="item" items="${Images}" varStatus="status">
			<div class="col-md-2 mb-3">
				<img class="rounded" alt="200x200" src=".${item.getSaveFileName()}" style="width: 200px; height: 200px;">
				<p class="float-left"><a href=".${item.getSaveFileName()}">Download</a></p>
			</div>
		</c:forEach>
    </div>
    
    <div class="row">
    	<div class="col-md-12 mb-3">
			<label for="Describe">Root Cause</label>
	    	<textarea class="form-control" id="RootCause" name="RootCause" rows="5">${Items.getRootCause()}</textarea>
		</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12 mb-3">
			<label for="Describe">Solution</label>
	    	<textarea class="form-control" id="Solution" name="Solution" rows="5">${Items.getSolution()}</textarea>
		</div>
    </div>
    
    <div class="row text-center">
    	<button class="btn btn-primary col-md-12 m-2" onClick="javascript:GoBack()">OK</button>
    </div>
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
function GoBack(){
	history.back();
}
</script>
</body>
</html>
