<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page
    language="java"
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
            <title>Sopl·licitud de reparació</title>
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
                        <a class="navbar-brand" href="javascript:window.history.back()">
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
            <section class="container">                    
     
                <form method="post" action="solReparacio" class="form-horizontal">
                    <fieldset>
                        <legend>Sol·licitud de reparació</legend>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="nom">Nom</label>
                            <div class="col-lg-10">
                                <input class="form-control" type="text" id="nom" name="nom" value="<%= session.getAttribute("usuari")%> " disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="cognom">Cognom</label>
                            <div class="col-lg-10">
                                <input class="form-control input-lg" type="text" id="cognom" name="cognom" value="<%= session.getAttribute("cognoms")%>" disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="email">Adreça electrònica:</label>
                            <div class="col-lg-10">
                                <input class="form-control input-lg" type="email" id="email" name="email" value="<%= session.getAttribute("email")%> " disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="telefon">Telèfon</label>
                            <div class="col-lg-10">
                                <input class="form-control input-lg" type="tel" id="telefon" name="telefon" value="<%= session.getAttribute("telefon")%>" disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="idEquip">Equip</label>

                            <div class="col-lg-10">
                                <select name="idEquip" id="idEquip" class="form-control input-lg" required>
                                    <c:forEach items="${equips}" var="equip">
                                        <option value="${equip.codi}">${equip.codi}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="comentaris">Descripció de la incidència:</label>
                            <div class="col-lg-10">
                                <textarea class="form-control input-lg" id="comentaris" name="comentaris" rows="5" cols="50" required></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <input class="btn btn-primary" type="submit" value="Desar" name="desar">
                            </div>
                        </div>
                    </fieldset>
                </form>
            <a href="javascript:window.history.back()" style="display: flex; justify-content: center; align-items: center;">
                <img src="/PROJECTE/resources/img/fletxa_2.svg" alt="Logo" style="width: 90px;">
            </a>               
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