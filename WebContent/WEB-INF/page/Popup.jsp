<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<form class="form-horizontal" action="addService" method="Post">
<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
 </div>
      <div class="modal-body">
 <div class="form-group">
    <label class="control-label col-sm-2" for="email">Name :</label>
    <div class="col-sm-10">
    	<input type="text" name="name" class="form-control" >
      
    </div>
  </div>
      </div>
<div class="modal-footer">
      <button type="submit" name="Submit" class="btn btn-primary">Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        
</div>
</form>