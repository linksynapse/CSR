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
	        <div class="row">
	          <div class="col-md-4 mb-3">
	            <label for="firstName">Your Name</label>
	            <input type="text" class="form-control" id="Name" name="Name" placeholder="" value="" required>
	            <div class="invalid-feedback">
	              Valid Name is required.
	            </div>
	          </div>
	          <div class="col-md-4 mb-3">
	            <label for="Tel">Contact number</label>
	            <input type="text" class="form-control" id="Tel" name="Tel" placeholder="" value="" required>
	            <div class="invalid-feedback">
	              Valid Contact number is required.
	            </div>
	          </div>
	          <div class="col-md-4 mb-3">
	            <label for="Email">Email</label>
	            <input type="email" class="form-control" id="Email" name="Email" placeholder="" value="" required>
	            <div class="invalid-feedback">
	              Valid Email is required. (If you input wrong email you can't receive process mail.)
	            </div>
	          </div>
	        </div>
	        
	        <div class="row">
	          <div class="col-md-6 mb-3">
	            <label for="Enviroment">Environment</label>
	            <select class="custom-select d-block w-100" id="Environment" name="Environment" required>
	              <option value="">Choose...</option>
	              <c:forEach var="item" items="${Environment}" varStatus="status">
			      	<option value="${item.getValue()}">${item.getName()}</option>
				  </c:forEach>
	            </select>
	            <div class="invalid-feedback">
	              Please select a valid enviroment.
	            </div>
	          </div>
	          
	          <div class="col-md-6 mb-3">
	            <label for="Country">Country</label>
	            <select class="custom-select d-block w-100" id="Country" name="Country" required>
	              <option value="">Choose...</option>
	              <c:forEach var="item" items="${Country}" varStatus="status">
			      	<option value="${item.getValue()}">${item.getName()}</option>
				  </c:forEach>
	            </select>
	            <div class="invalid-feedback">
	              Please select a valid country.
	            </div>
	          </div>
	        </div>
	        
	        <div class="mb-3">
	          <label for="Address">Address</label>
	          <input type="text" class="form-control" id="Address" name="Address" placeholder="" required>
	          <div class="invalid-feedback">
	            Please enter your address.
	          </div>
	        </div>
	        
	        <div class="row">
		        <div class="col-md-12 mb-3">
		        <label for="Files">Files Upload</label>
		          <div class="custom-file">
				    <input type="file" class="custom-file-input" name="Files" id="Files" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
				    <label class="custom-file-label" for="Files">Choose file</label>
				  </div>
		        </div>
		        
		        <div class="col-md-12 mb-3" id="filelist">
		        </div>
		        
		        <div class="col-md-12 mb-3">
		          <label for="Describe">Describe your problem</label>
	    		  <textarea class="form-control" id="Describe" name="Describe" rows="5" required></textarea>
		          <div class="invalid-feedback">
		            Please writing your problem.
		          </div>
		        </div>
	        </div>
	
	        <hr class="mb-4">
	        <button class="g-recaptcha btn btn-primary btn-lg btn-block" 
		        data-sitekey="6LfoL9EZAAAAAKfpwziXDYhztcYSBTlAjeA6gVw7" 
		        data-callback='submit' 
		        data-action='submit'>Submit</button>
	      </form>
	    </div>
	  </div>
	
	  <footer class="my-5 pt-5 text-muted text-center text-small">
	    <p class="mb-1">Bluzen Pte Ltd &copy; 2013-2020</p>
	  </footer>
	  
	  <div class="modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Infomation</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="resultMsg">
		        <p>Your Case ID "BVCS001232" is successfully apply.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('$(".m-n-L").M("N",5(e){7(!e.o.3)q;8 3=e.o.3;8 1="<r 9=\\"1-s\\">";O(8 i=0;i<3.t;i++){1+="<u 9=\\"1-s-P\\"><p 9=\\"v-Q\\" w=\\"x-y:z\\">";1+=3[i].R;1+="</p><p 9=\\"v-S\\" w=\\"x-y:z\\">";1+=3[i].T;1+=" U</p></u>"}1+="</r>";$(V).W(".m-n-X").b("Y").6(3.t+" Z");$("#10").6(1)});5 A(){11.12(c)}5 f(){8 g=4;7($(\'#h\').j(0).13()===4){B.14();B.15();g=c}$(\'#h\').j(0).16.17(\'18-19\');7(g){q 4}$(\'#f\').C(\'D\',c);$(\'#E\').b(\'d-a\');$(\'#F\').G(\'d-a\');$.1a({1b:"1c",1d:4,1e:"1f",2:1g 1h($(\'#h\').j(0)),1i:4,1j:4,1k:5(2){7(2.1l==0){$(\'#k\').6("1m 1n 1o \\""+2.1p+"\\" 1q 1r 1s.")}1t{$(\'#k\').6("H l I \\""+2.J+"\\"")}},l:5(2){$(\'#k\').6("H l I \\""+2.J+"\\"")}}).1u(5(2){$(\'#f\').C(\'D\',4);$(\'#E\').G(\'d-a\');$(\'#F\').b(\'d-a\');1v("A()",1w);$(\'.K\').K(\'1x\')})}',62,96,'|list|data|files|false|function|html|if|var|class|none|addClass|true|||submit|isCheck|hello||get|resultMsg|error|custom|file|target||return|ul|group|length|li|float|style|margin|bottom|0rem|refresh|event|prop|disabled|mFrame|loader|removeClass|Apply|reason|Msg|modal|input|on|change|for|item|left|name|right|size|bytes|this|siblings|label|selected|Files|filelist|location|reload|checkValidity|preventDefault|stopPropagation|classList|add|was|validated|ajax|type|POST|cache|url|Commit|new|FormData|contentType|processData|success|Code|Your|Case|ID|Data|is|successfully|apply|else|done|setTimeout|5000|show'.split('|'),0,{}))
</script>
</body>
</html>
