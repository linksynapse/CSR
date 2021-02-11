<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bluzen CSR</title>

    <!-- Bootstrap core CSS -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/customer.css">
    <!-- Custom styles for this template -->
    <link href="assets/css/form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
  	<header style="background-color:#EF6F2D; height:100%;">
		  <a style="color:white; font-size:2rem; margin-left:2rem; height:100%; font-weight:500;">BLUZEN CSR</a>
	</header>
  	<div id="loader" class="d-none"></div>
    <div id="mFrame" class="container">
	  <div class="py-5 text-center">
	    <img class="d-block mx-auto mb-4" src="assets/image/logo.png" alt="" width="72" height="72">
	    <h2>BLUZEN CSR</h2>
	  </div>
	
	  <div class="row">
	    <div class="col-md-12 order-md-1">
	    	
	      <h4 class="mb-3"></h4>
	      <form class="needs-validation" id="hello" action="javascript:submit()" novalidate>
	      	<div class="col-md-12 mb-3">
		        <label for="Files">Take Picture</label>
		          <div class="custom-file">
				    <input type="file" class="custom-file-input" name="Files" id="Files" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
				    <label class="custom-file-label" for="Files">Choose file</label>
				    <div class="invalid-feedback">
			            Please take your picture
			          </div>
				  </div>
				  <div class="col-md-12 mb-3" id="filelist">
		        </div>
			</div>
			<div class="col-md-12 mb-3">
	            <label for="LocationCode">Location</label>
	            <select class="custom-select d-block w-100" id="LocationCode" name="LocationCode" required>
	              <option value="">Choose...</option>
	              <c:forEach var="item" items="${Locations}" varStatus="status">
			      	<option value="${item.getValue()}">${item.getName()}</option>
				  </c:forEach>
	            </select>
	            <div class="invalid-feedback">
	              Please select a valid location.
	            </div>
	          </div>
			<input type="hidden" id="latitude" name="latitude" value="" required>
			<input type="hidden" id="longitude" name="longitude" value="" required>
			<div class="col-md-12 mb-3">
	        <button class="btn btn-primary btn-lg btn-block">Exit</button>
	        </div>
	      </form>
	      
	    </div>
	  </div>
	
	  <footer class="my-5 pt-5 text-muted text-center text-small">
	    <p class="mb-1">Bluzen Pte Ltd &copy; 2013-2020</p>
	  </footer>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(".custom-file-input").on("change", function(e) {
	//var fileName = $(this).val().split("\\").pop();
	//$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	
	if(!e.target.files) return;
		
	var files = e.target.files;
	var list = "<ul class=\"list-group\">";
	for(var i=0; i < files.length; i++) {
		list += "<li class=\"list-group-item\"><p class=\"float-left\" style=\"margin-bottom:0rem\">";
		list += files[i].name;
		list += "</p><p class=\"float-right\" style=\"margin-bottom:0rem\">";
		list += files[i].size;
		list += " bytes</p></li>";
	}
	list += "</ul>";
	$(this).siblings(".custom-file-label").addClass("selected").html(files.length + " Files");
	$("#filelist").html(list);
});

function getLocation(){
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	
	    $('#latitude').val(position.coords.latitude)
	    $('#longitude').val(position.coords.longitude)
	      $.ajax({
	          type     : "POST",
	          cache    : false,
	          url      : "commuteExit",
	          dataType : "json",
	          data     : new FormData($('#hello').get(0)),
	          contentType: false,
	          processData: false,
	          success  : function(data) {
	          	if(data.Code == 0){
	          		alert(data.Msg);
	          	}else{
	          		alert(data.Msg);
	          	}
	          },
	          error: function(data){
	        	  alert("Error");
	          }
	  	}).done(function(data){
	  		$('#submit').prop('disabled', false);
	    	$('#mFrame').removeClass('d-none');
	    	$('#loader').addClass('d-none');
	    });
	      
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
		  $('#submit').prop('disabled', false);
	    	$('#mFrame').removeClass('d-none');
	    	$('#loader').addClass('d-none');
	    	alert("must have turn on GPS");
	    return null;
	  }
}

function submit() {
	var isCheck = false;
	
	if ($('#hello').get(0).checkValidity() === false) {
        //event.preventDefault();
        //event.stopPropagation();
        isCheck = true;
      }
	$('#hello').get(0).classList.add('was-validated');
	
	if (isCheck){
		return false;
	}
	
	$('#submit').prop('disabled', true);
	$('#mFrame').addClass('d-none');
	$('#loader').removeClass('d-none');
	
	getLocation();
}
</script>
</body>
</html>
