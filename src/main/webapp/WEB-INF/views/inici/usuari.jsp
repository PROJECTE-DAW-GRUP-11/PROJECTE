<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="cat.xtec.ioc.domain.Usuari" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ca">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>Benvinguda</title>
    </head>
    <body>
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
                           <a href="#">Inici</a>
                        </li>
                        <li>
                            <a href="<spring:url value= '/reparacions/sollicitud'/>">Sol·licitar reparació</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>
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
        <section>
            <div class="jumbotron">
                <div class="container">
                    <img class="img-responsive" src="/PROJECTE/resources/img/logo_g.png"  width="50" height="100" align="left" style="margin-right:20px"/>
                    <h2 class="ml-2">Usuari: Sol·licitud de reparacions i reserva d'espais </h2>
                </div>
            </div>    
            <div class="container" style="margin-top:65px">
                <div class="row align-content-center justify-content-center">
                    <div class="col-4 col-md-4 col-xl-4 bg-primary">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-center"></h3>
                                <p class="card-text text-center h3">
                                    <span><br><br><a style="text-decoration:none; color:whitesmoke" href="<spring:url value= '/reparacions/sollicitud'/>">
                                            Sol·licitar reparació</a><br><br><br></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 col-md-4 col-xl-4 bg-success">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-center"></h3>
                                <p class="card-text text-center h3">
                                    <span><br><br><a style="text-decoration:none; color:grey" href="<spring:url value= '/reserves/llistar'/>?idusuari=<%= session.getAttribute("id")%>'">
                                            Reserva Espais</a><br><br></span><br></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 col-md-4 col-xl-4 bg-info">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-center"></h3>
                                <p class="card-text text-center h3">
                                    <span><br><br><a style="text-decoration:none; color:grey" href="<spring:url value= '/usuaris/perfil'/>">
                                            Perfil usuari</a><br><br><br></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div style = "background-color:#F0F0F0; margin-top:95px">
            <br>
            <footer class="container-fluid text-center">
                <div class="copyrights" style="margin-top:25px;">
                    <p>© 2023, Tots els drets reservats
                        <br>
                        <span>GEEC</span></p>
                    <p><a href="#" target="_blank">INFO </a></p>
                </div>
            </footer>
        </div>
    </body>
</html>
