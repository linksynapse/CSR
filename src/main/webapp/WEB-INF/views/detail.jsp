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
    	<div class="col-md-6 mb-3">
			<label for="TaskClass">Task Class</label>
			<input type="text" class="form-control" id="TaskClass" name="TaskClass" placeholder="" value="${Items.getTaskClass()}">
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="ContactType">Contact Type</label>
	        <select class="custom-select d-block w-100" id="ContactType" name="ContactType">
	            <option value="0">Choose...</option>
			    <option value="1">Remote</option>
			    <option value="2">On-Site</option>
	        </select>
		</div>
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
    	<button class="btn btn-primary col-md-2 m-2" onClick="javascript:Save('${Items.getCaseID()}')">Save</button>
    	<button class="btn btn-primary col-md-2 m-2" onClick="javascript:Clear('${Items.getCaseID()}')">Clear</button>
    	<button class="btn btn-danger col-md-2 m-2" onClick="javascript:OutOfScope('${Items.getCaseID()}')">Out Of Scope</button>
    	<button class="btn btn-secondary col-md-2 m-2" onClick="javascript:Escalated('${Items.getCaseID()}')">Escalated</button>
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
$('#ContactType').val("${Items.getContactType()}");
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('r C(m){7 1=6.8("1");1.0("s","t");1.0("u","./n");7 f=6.8("a");f.0("b","c");f.0("d","v");f.0("e",m);1.9(f);7 g=6.8("a");g.0("b","c");g.0("d","w");g.0("e",5);1.9(g);7 h=6.8("a");h.0("b","c");h.0("d","o");h.0("e",$(\'#o\').l());1.9(h);7 i=6.8("a");i.0("b","c");i.0("d","p");i.0("e",$(\'#p\').l());1.9(i);7 j=6.8("a");j.0("b","c");j.0("d","x");j.0("e",$(\'#y\').l());1.9(j);7 k=6.8("a");k.0("b","c");k.0("d","q");k.0("e",$(\'#q z:A\').l());1.9(k);6.B.9(1);1.n()}r D(m){7 1=6.8("1");1.0("s","t");1.0("u","./n");7 f=6.8("a");f.0("b","c");f.0("d","v");f.0("e",m);1.9(f);7 g=6.8("a");g.0("b","c");g.0("d","w");g.0("e",2);1.9(g);7 h=6.8("a");h.0("b","c");h.0("d","o");h.0("e",$(\'#o\').l());1.9(h);7 i=6.8("a");i.0("b","c");i.0("d","p");i.0("e",$(\'#p\').l());1.9(i);7 j=6.8("a");j.0("b","c");j.0("d","x");j.0("e",$(\'#y\').l());1.9(j);7 k=6.8("a");k.0("b","c");k.0("d","q");k.0("e",$(\'#q z:A\').l());1.9(k);6.B.9(1);1.n()}r E(m){7 1=6.8("1");1.0("s","t");1.0("u","./n");7 f=6.8("a");f.0("b","c");f.0("d","v");f.0("e",m);1.9(f);7 g=6.8("a");g.0("b","c");g.0("d","w");g.0("e",4);1.9(g);7 h=6.8("a");h.0("b","c");h.0("d","o");h.0("e",$(\'#o\').l());1.9(h);7 i=6.8("a");i.0("b","c");i.0("d","p");i.0("e",$(\'#p\').l());1.9(i);7 j=6.8("a");j.0("b","c");j.0("d","x");j.0("e",$(\'#y\').l());1.9(j);7 k=6.8("a");k.0("b","c");k.0("d","q");k.0("e",$(\'#q z:A\').l());1.9(k);6.B.9(1);1.n()}r F(m){7 1=6.8("1");1.0("s","t");1.0("u","./n");7 f=6.8("a");f.0("b","c");f.0("d","v");f.0("e",m);1.9(f);7 g=6.8("a");g.0("b","c");g.0("d","w");g.0("e",3);1.9(g);7 h=6.8("a");h.0("b","c");h.0("d","o");h.0("e",$(\'#o\').l());1.9(h);7 i=6.8("a");i.0("b","c");i.0("d","p");i.0("e",$(\'#p\').l());1.9(i);7 j=6.8("a");j.0("b","c");j.0("d","x");j.0("e",$(\'#y\').l());1.9(j);7 k=6.8("a");k.0("b","c");k.0("d","q");k.0("e",$(\'#q z:A\').l());1.9(k);6.B.9(1);1.n()}',42,42,'setAttribute|form|||||document|var|createElement|appendChild|input|type|hidden|name|value|hiddenField|_hiddenField|__hiddenField|___hiddenField|____hiddenField|_____hiddenField|val|caseid|submit|RootCause|Solution|ContactType|function|method|POST|action|CaseID|Status|Taskclass|TaskClass|option|selected|body|Save|Clear|OutOfScope|Escalated'.split('|'),0,{}))
</script>
</body>
</html>
