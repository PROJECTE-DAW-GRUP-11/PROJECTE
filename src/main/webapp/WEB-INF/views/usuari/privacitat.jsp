<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page
    language="java"
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="ca">
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
            <!-- Select2 -->
            <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
            <title>Política de privacitat i cookies</title>
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

                        <a class="navbar-brand logo" href="javascript:window.history.back()"><img src="/PROJECTE/resources/img/logo.png" alt="Logo"></a>
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
                        <h1 class="ml-2">Política de privacitat i cookies</h1>
                    </div>
                </div> 
                <div class="container">
                    <h2>Política de privacitat</h2>
                    <p>D'acord amb el que preveu el Reglament (UE) 2016/679 del Parlament Europeu i del Consell de 27 d'abril de 2016 relatiu a la Protecció de les Persones Físiques respecte al tractament de dades personals i a la lliure circulació de dades, us informem que les vostres dades son tractades, d'acord amb el que preveu el Reglament abans esmentat, amb la finalitat de donar-vos el servei sol·licitat i mantenir les relacions comercials. Les podem cedir a tercers quan sigui necessari per compliment d'obligacions legals, per comunicats informatius,per oferta de productes i serveis.</p>
                    <p>En qualsevol moment podeu exercir els drets d'accés, rectificació, supressió, limitació, portabilitat i oposició respecte a les vostres dades de caràcter personal previstos a la llei, enviant un escrit a:</p>
                    <address>
                        Carrer Barcelona, 22<br>
                        08080 Barccelona<br>
                        Telèfon: 93 123 12 32<br>
                        Correu electrònic: geec@geec.cat
                    </address>


                    <h2>Política de cookies</h2>
                    <p>Quan visiteu qualsevol lloc web, aquest pot emmagatzemar o recuperar informació al vostre navegador, principalment en forma de galetes. Aquesta informació pot ser sobre vosaltres, les vostres preferències o el vostre dispositiu i s?utilitza principalment per fer que el lloc funcion com espereu. La informació no sol identificar-vos directament, però pot proporcionar-vos una experiència web més personalitzada. Com que respectem el vostre dret a la privades, podeu optar per no permetre alguns tipus de galetes.</p>
                    <p>En utilitzar aquest lloc web, accepteu l'ús de les següents categories de galetes:</p>
                    <ul>
                        <li>Galetes estrictament necessàries: aquestes galetes són imprescindibles perquè el lloc web funcioni correctament.</li>
                    </ul>
                </div>
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
                                <span class="h4 font-weight-bold">Informació de contacte:</span>
                                <ul class="list-unstyled text-center">
                                    <li>Carrer Barcelona, 22</li>
                                    <li>931231232</li>
                                    <li>geec@geec.cat</li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <br>
                                <p class="text-dark mb-2 text-center">© 2023,Tots els drets reservatss</p>
                                <p class="text-dark mb-2 h5 text-center">GEEC</p>
                                <p class="text-dark mb-2 text-center"><a href="<spring:url value= '/usuaris/privacitat/'/>">Política de privacitat</a></p>
                            </div>
                            <div class="col-md-4">
                                <span class="h4 mb-2 font-weight-bold">Creat per:</span>
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

