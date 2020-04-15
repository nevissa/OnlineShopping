<%@include file="../flows-shared/header.jsp" %>
<div class="container">
	
	<div class="row">
	
		<div class="col-sm-6">
	
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>informtions personnelles</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
						<h4>Nom_Prenom : ${registerModel.user.firstName} ${registerModel.user.lastName}</strong></h4>
						<h4>Email : ${registerModel.user.email}</h4>
						<h4>Contact : ${registerModel.user.contactNumber}</h4>
						<h4>Role : ${registerModel.user.role}</h4>
						<p>
							<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Modifier</a>
						</p>
					</div>
				</div>
			
			</div>
					
		
		</div>
		
		<div class="col-sm-6">
		
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>Adresse de livraison</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
						<p>${registerModel.billing.addressLineOne}, </p>
						<p>${registerModel.billing.addressLineTwo}, </p>
						<p>${registerModel.billing.city} -  ${registerModel.billing.postalCode}, </p>
						<p>${registerModel.billing.state}</p>
						
							<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit</a>
						</p>
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
	
	<div class="row">
		
		<div class="col-sm-4 col-sm-offset-4">
			
			<div class="text-center">
				
				<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-lg btn-primary">Confirmer</a>
				
			</div>
			
		</div>
		
	</div>

</div>
<%@include file="../flows-shared/footer.jsp" %>