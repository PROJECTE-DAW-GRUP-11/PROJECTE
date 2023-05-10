<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ca">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>Benvinguda</title>
        <style>
            .navbar-brand img {
                width: 95px;
                height: auto;
                margin-top: -8px;
            }
        </style>
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
                    <div>
                        <a class="navbar-brand" href="#">
                            <img src="/PROJECTE/resources/img/logo.png" alt="Logo">
                        </a>
                    </div>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href=" <spring:url value= '/usuaris/perfil'/>"><%= session.getAttribute("usuari")%> 
                                <%= session.getAttribute("cognoms")%></a>
                        </li>
                        <li>
                            <form  action="logout" method="GET">
                               <button class="btn-lg btn-link" type="submit">
                                    <span class="icon"><i class="bi bi-power" style="font-size:25px; color:#1F9D93"></i></span>
                                </button>
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
                    <h1 class="ml-2">Administrador d'usuaris i equips</h1>
                </div>
            </div>    
            <div class="container" style="margin-top:65px">
                <div class="row align-content-center">
                    <div class="col-3 col-md-3 col-xl-3" style=" background-color:#0071BC">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-center"></h3>
                                <p class="card-text text-center h3">
                                    <span><br><br><a style="text-decoration:none; color:whitesmoke" href="<spring:url value= '/usuaris/afegir'/>">
                                            Nou usuari</a><br><br><br></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 col-md-3 col-xl-3"  style ="background-color:#0489AB">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-center"></h3>
                                <p class="card-text text-center h3">
                                    <span><br><br><a class="text-light" style="text-decoration:none; color:whitesmoke" href="<spring:url value= '/usuaris/llistar'/>">
                                            Llistar usuaris</a><br><br></span><br></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 col-md-3 col-xl-3" style ="background-color:#1F9D93">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-center"></h3>
                                <p class="card-text text-center h3">
                                    <span><br><br><a style="text-decoration:none; color:whitesmoke" href="<spring:url value= '/equips/llistar/'/>">
                                            Llistar equips</a><br><br></span><br></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 col-md-3 col-xl-3" style ="background-color:#22B573">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title text-center"></h3>
                                <p class="card-text text-center h3">
                                    <span><br><br><a style="text-decoration:none; color:whitesmoke" href="<spring:url value= '/espais/llistar/'/>">
                                            Llistar espais</a><br><br></span><br></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <div style="background-color:#F0F0F0; margin-top:100px;">
            <br>
            <footer class="text-center" style="min-height: 175px">
                <div class="container py-3">
                    <div class="row text-dark mb-2">
                        <div class="col-md-4">
                            <i class="bi bi-mailbox"></i><span class="h4 font-weight-bold">  Informació de contacte:</span><br>
                           <ul class="list-unstyled text-center">
                                <li>Carrer Barcelona, 22</li>
                                <li>931231232</li>
                                <li>geec@geec.cat</li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <br>
                            <p class="text-dark mb-2 text-center h5">© 2023,Tots els drets reservats</p>
                            <p class="text-dark mb-2 h5 text-center h5">GEEC</p>
                            <p class="text-dark mb-2 text-center"><a href="<spring:url value= '/usuaris/privacitat/'/>">Política de privacitat</a></p>
                        </div>
                        <div class="col-md-4">
                            <i class="bi bi-person-check"></i><span class="h4 mb-2 font-weight-bold">  Creat per:</span><br>
                            <ul class="list-unstyled text-center">
                                <li>Carlos Barrachina</li>
                                <li>Javier Bernat</li>
                                <li>Denis Gualda</li>
                                <li>Ingrid Ramírez</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
