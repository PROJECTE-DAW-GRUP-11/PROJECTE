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
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
            <!-- jQuery -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <!-- Select2 -->
            <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

            <title>Llistat equips</title>
            <style>
                .navbar-brand img {
                    width: 95px;
                    height: auto;
                    margin-top: -8px;
                }



                /*RESALTA AL PASSAR PER SOBRE UNA FILA */
                .table-row-link:hover {
                    cursor: pointer;
                    background-color: #DFF0D8;
                    color:8C8080;

                }
                option{
                    text-align:center;
                }

                .navbar-brand img {
                    width: 95px;
                    height: auto;
                    margin-top: -8px;
                }

            </style>
            <script src="<c:url value="/resources/js/llistatEquips.js" />"></script>
        </head>
        <body>

            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Navegaci�</span>
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
            <!-- CONTAINER -->
            <section>
                <div class="jumbotron">
                    <div class="container">
                        <img class="img-responsive" src="/PROJECTE/resources/img/logo_g.png"  width="50" height="100" align="left" style="margin-right:20px"/>
                        <h1 class="ml-2">Llistat d'equips</h1>
                    </div>
                </div>
            </section>


            <section class="container">
                <div id="posTabla" class="table-responsive">
                    <table id="mytable" class="table">
                        <thead class="thead-dark">



                        <th class="text-center" scope="col">
                            <SELECT class="js-example-basic-single" id="selCodi" style="width:100%" onchange="myFunction()">
                                <OPTION>Codi</OPTION>
                                    <c:forEach items="${equips}" var="equip">
                                    <OPTION>${equip.codi}</OPTION>
                                    </c:forEach>
                            </SELECT>
                        </th>


                        <th class="text-center" scope="col">
                            <SELECT class="js-example-basic-single" id="selTipus" style="width:100%" onchange="myFunction()">
                                <OPTION>Tipus</OPTION>
                                <OPTION>Pantalla</OPTION>
                                <OPTION>Dockstation</OPTION>
                            </SELECT></th>
                        <th class="text-center" scope="col">N/S</th>
                        <th class="text-center" scope="col">Marca</th>
                        <th class="text-center" scope="col">Model</th>
                        <th class="text-center" scope="col">
                            <SELECT class="js-example-basic-single" id="selEstat" style="width:100%" onchange="myFunction()">
                                <OPTION>Estat</OPTION>
                                <OPTION>Servei</OPTION>
                                <OPTION>Stock</OPTION>
                                <OPTION>Reparacio</OPTION>
                            </SELECT>
                        </th>

                        </thead>                
                        <c:forEach items="${equips}" var="equip">
                            <% if ("Tecnic".equals(session.getAttribute("rol"))) { %>
                            <tr scope="row" class="table-row-link" id="fila" onclick="window.location = '<spring:url value='/equips/equip'/>?codi=${equip.codi}'">
                                <% } else {%>
                            <tr scope="row" class="table-row-link" id="fila">
                                <% }%>
                                <td class="text-center"> ${equip.codi}</td>
                                <td class="text-center">${equip.tipus}</td>
                                <td class="text-center"> ${equip.numserie}</td>
                                <td class="text-center"> ${equip.marca}</td>
                                <td class="text-center"> ${equip.model}</td>
                                <td class="text-center"> ${equip.estat}</td>


                            </tr>

                        </c:forEach>
                    </table>
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
                                <i class="bi bi-mailbox"></i><span class="h4 font-weight-bold">  Informaci� de contacte:</span><br>
                                <ul class="list-unstyled text-center">
                                    <li>Carrer Barcelona, 22</li>
                                    <li>931231232</li>
                                    <li>geec@geec.cat</li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <br>
                                <p class="text-dark mb-2 text-center h5">� 2023,Tots els drets reservats</p>
                                <p class="text-dark mb-2 h5 text-center h5">GEEC</p>
                                <p class="text-dark mb-2 text-center"><a href="<spring:url value= '/usuaris/privacitat/'/>">Pol�tica de privacitat</a></p>
                            </div>
                            <div class="col-md-4">
                                <i class="bi bi-person-check"></i><span class="h4 mb-2 font-weight-bold">  Creat per:</span><br>
                                <ul class="list-unstyled text-center">
                                    <li>Carlos Barrachina</li>
                                    <li>Javier Bernat</li>
                                    <li>Denis Gualda</li>
                                    <li>Ingrid Ram�rez</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </body>
    </html>
