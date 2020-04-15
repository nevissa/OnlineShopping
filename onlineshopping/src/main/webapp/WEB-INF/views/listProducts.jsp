<div class="container">

	<div class="row">


		<!-- Would be to display sidebar -->
	

		<!-- to display the actual products -->
		<div class="col-md-9">

			<!-- Added breadcrumb component -->
			<div class="row">

				<div class="col-lg-12">

					<c:if test="${userClickAllProducts == true}">
					
						<script>
							window.categoryId = '';
						</script>
					
						<ol class="breadcrumb">


							<li><a href="${contextRoot}/home">Accueil</a></li>
							<li class="active">Tous les produits <li>


						</ol>
					</c:if>
					
					
					<c:if test="${userClickCategoryProducts == true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
					
						<ol class="breadcrumb">


							<li><a href="${contextRoot}/home">Accueil</a></li>
							<li class="active">Categorie</li>
							<li class="active">${category.name}</li>


						</ol>
					</c:if>
					

				</div>


			</div>

			
			<div class="row">
			
				<div class="col-xs-12">
				
					
					<table id="productListTable" class="table table-striped ">
					
					
						<thead>
						
							<tr >
								<th></th>
								<th>Nom</th>
								<th>Marque</th>
								<th>Prix</th>
								<th>Quantité</th>
								<th></th>
							
							</tr>
						
						</thead>
					

						
					</table>
				
				</div>
			
			</div>


		</div>



	</div>






</div>