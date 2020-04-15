<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
	<script>
		window.userRole = '${userModel.role}';
	</script>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a style ="color:#dc5ab1e0;" class="navbar-brand" href="${contextRoot}/home">RIMVente</a>
            </div>
            
             <ul class="nav navbar-nav ">
	                   
						
			    	<security:authorize access="isAuthenticated()">
						<li class="dropdown" id="userModel">
						  <a  style =" border-color:white; height:40px;font-size:16px;" class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						   Nos Categories
						    <span class="caret"></span>
						  </a>
						  						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						  						  
						  						  
						  						  <c:forEach items="${categories}" var="category">
		<a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item" id="a_${category.name}">${category.name}</a>
	</c:forEach>
						  						  
						  						  
						  						  
						  						  
						  						  
						  						  
						  						  
						  						  
						  						  
						  						  
						  						  
						  						  </ul>
						  		
						</li>    			    
			    	</security:authorize>                    
			    </ul>                
                
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                  

                    
                    <li id="listProducts">
                    </li>
					<security:authorize access="hasAuthority('ADMIN')">
	                    <li id="manageProduct">
	                        <a href="${contextRoot}/manage/product">GESTION PRODUITS</a>
	                    </li>					
					</security:authorize>
                </ul>
			    
			    <ul class="nav navbar-nav navbar-right">
			    	<security:authorize access="isAnonymous()">
	                    <li id="signup">
	                        <a href="${contextRoot}/membership">Deconnexion</a>
	                    </li>
						<li id="login">
	                        <a href="${contextRoot}/login">Connexion</a>
	                    </li> 			    	
			    	</security:authorize>
			    	<security:authorize access="isAuthenticated()">
						<li class="dropdown" id="userModel">
						  <a  style ="background-color:#dc5ab1e0; border-color:white; height:39px;font-size:15px;" class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    Compte
						    <span class="caret"></span>
						  </a>
						  <ul  style="font-size:smaller;" class="dropdown-menu" aria-labelledby="dropdownMenu1">
		                    <security:authorize access="hasAuthority('USER')">
			                    <li id="cart">
			                        <a href="${contextRoot}/cart/show">
			                        	<span style="font-size:smaller;" class="glyphicon glyphicon-shopping-cart"></span><span  style="font-size:smaller;" class="badge">${userModel.cart.cartLines}</span>  ${userModel.cart.grandTotal} 
			                        </a>
			                    </li>		     
			                	<li role="separator" class="divider"></li>	                                   
		                    </security:authorize>
		                    
		                                        <li id="contact">
                        <a href="${contextRoot}/profil">Mon Profil</a>
                        
                    </li>                    <li id="contact">
                        
                    </li>
		                    
							<li id="logout">
		                        <a href="${contextRoot}/logout">Deconnexion</a>
		                    </li>                    			    	
						  </ul>		
						</li>    			    
			    	</security:authorize>                    
			    </ul>                
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

