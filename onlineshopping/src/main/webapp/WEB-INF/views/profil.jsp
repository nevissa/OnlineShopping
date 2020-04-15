<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<div class="container">
<div class="row">	
<h1>Mon Profil</h1>
<img src="${images}/profil.png"  style="width:110px;"/>

<p>NOM: ${userModel.firstName}	</p>
<p>Prenom: ${userModel.lastName}	</p>
<p>Email: ${userModel.email}	</p>
	
<!-- Modal -->
	<div class="modal fade" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">New Category</h4>
	      </div>
	      <div class="modal-body">
	        
	        <sf:form id="categoryForm" class="form-horizontal" modelAttribute="user" action="${contextRoot}/user/profil" method="POST">
	        	
       			<div class="form-group">
					<label class="control-label col-md-4">Name</label>
					<div class="col-md-8 validate">
						<sf:input type="text" path="role" class="form-control"
							placeholder="Category Name" /> 
					</div>
				</div>
       			
       			<div class="form-group">				
					<label class="control-label col-md-4">Description</label>
					<div class="col-md-8 validate">
 
					</div>
				</div>	        	        
	        
	        
				<div class="form-group">				
					<div class="col-md-offset-4 col-md-4">					
						<input type="submit" name="submit" value="Save" class="btn btn-primary"/>						
					</div>
				</div>	        
	        </sf:form>
	      </div>
	    </div>
	  </div>
	</div>
</div>	




<button type="button" style ="background-color:#dc5ab1e0; border-color:white; height:49px;font-size:18px;margin-left:-18px;" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myProfilModal">Modifier Profil</button>

       

</div>