<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>        
        <title>Usuari</title>
        
    </head>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Navegació</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><span class="h2 text-center">geec</span></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                       <a href="<spring:url value= '/usuaris/user'/>">Inici</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                     <li>
                        <a href="<spring:url value= '/usuaris/perfil'/>"><%= session.getAttribute("usuari")%> 
                            <%= session.getAttribute("cognoms")%></a>
                    </li>
                    <li>
                        <form  action="logout" method="GET">
                            <input class="btn-lg btn-link" style="color:crimson;"  
                                   type="submit" value="Tancar Sessió">
                        </form>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>

    <body>
	<div class="container">
            <div class="row mt-3">
                <div class="col-sm-8">
                    <span class ="h2"><%= session.getAttribute("usuari")%> 
                        <%= session.getAttribute("cognoms")%></span><br>
                    <span class="h4"><%= session.getAttribute("email")%> </span>
                    <a href="<c:url value= '/usuaris/modificar?idusuari=${sessionScope.id}'/>" class="btn btn-primary">Editar</a>
                </div>
            </div>
            <hr>
            <span class="h3">Informació Personal</span>
            <form>
                <div class="form-group">
                    <label for="id">Codi:</label>
                    <input type="text" class="form-control" id="id"
                            value="<%= session.getAttribute("id")%>" disabled>
                </div>
                <div class="form-group">
                    <label for="nombre">Nom</label>
                    <input type="text" class="form-control" id="nom"
                            value="<%= session.getAttribute("usuari")%>" disabled>
                </div>
                <div class="form-group">
                    <label for="cognoms">Cognoms</label>
                    <input type="text" class="form-control" id="apellido"
                            value="<%= session.getAttribute("cognoms")%>" disabled>
                </div>
                <div class="form-group">
                    <label for="telefon">Telèfon</label>
                    <input type="text" class="form-control" id="telefono"
                            value="<%= session.getAttribute("telefon")%>" disabled>
                </div>
                <div class="form-group">
                    <label for="adreca">Password</label>
                    <input type="password" class="form-control" id="password"
                            value="<%= session.getAttribute("cognoms")%>" disabled>
                </div>
                <div class="form-group">
                    <label for="adreca">Rol</label>
                    <input type="text" class="form-control" id="adreca"
                            value="<%= session.getAttribute("rol")%>" disabled>
                </div>
            </form>
        </div>
        <div style = "background-color:#F0F0F0; margin-top:95px">
            <br>
            <footer class="container-fluid text-center">
                    <p>© 2023, Tots els drets reservats
                        <br>
                        <span>GEEC</span></p>
                    <p><a href="#" target="_blank">INFO </a></p>
            
                <br>
            </footer>
        </div>
    </body>
</html>