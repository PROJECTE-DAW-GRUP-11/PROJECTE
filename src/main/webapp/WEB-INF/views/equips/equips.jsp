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
            <!-- jQuery -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <!-- Select2 -->
            <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

            <title>Llistat equips</title>
            <style>



                /*RESALTA AL PASSAR PER SOBRE UNA FILA */
                .table-row-link:hover {
                    cursor: pointer;
                    background-color: #DFF0D8;
                    color:8C8080;

                }
                option{
                    text-align:center;
                }

            </style>
            <script src="<c:url value="/resources/js/llistatEquips.js" />"></script>
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
                            <li>
                                <a href="<spring:url value= '/usuaris/tecnic'/>">Inici</a>
                            </li>
                            <li>
                                <a href="<spring:url value= '/reparacions/llistar'/>">Llistar reparacions</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Equips <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<spring:url value= '/equips/afegir'/>">Nou Equip</a></li>
                                    <li  class="active"><a href="<spring:url value= '/equips/llistar'/>">Llistar equips</a></li>
                                </ul>
                            </li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#"><%= session.getAttribute("usuari")%> 
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
                            <SELECT class="js-example-basic-single" id="selCodi" style="width:75%" onchange="myFunction()">
                                <OPTION>Codi</OPTION>
                                    <c:forEach items="${equips}" var="equip">
                                    <OPTION>${equip.codi}</OPTION>
                                    </c:forEach>
                            </SELECT>
                        </th>


                        <th class="text-center" scope="col">
                            <SELECT class="js-example-basic-single" id="selTipus" style="width:75%" onchange="myFunction()">
                                <OPTION>Tipus</OPTION>
                                <OPTION>Pantalla</OPTION>
                                <OPTION>Dockstation</OPTION>
                            </SELECT></th>
                        <th class="text-center" scope="col">N/S</th>
                        <th class="text-center" scope="col">Marca</th>
                        <th class="text-center" scope="col">Model</th>
                        <th class="text-center" scope="col">
                            <SELECT class="js-example-basic-single" id="selEstat" style="width:75%" onchange="myFunction()">
                                <OPTION>Estat</OPTION>
                                <OPTION>Servei</OPTION>
                                <OPTION>Stock</OPTION>
                                <OPTION>Reparacio</OPTION>
                            </SELECT>
                        </th>

                        </thead>                
                        <c:forEach items="${equips}" var="equip">
                            <tr scope="row" class="table-row-link" id="fila" onclick="window.location = '<spring:url value='/equips/equip'/>?codi=${equip.codi}'">

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
            </section>
            <div style = "background-color:#F0F0F0; margin-top:95px">
                <br>
                <footer class="container-fluid text-center">
                    <div class="copyrights" style="margin-top:25px;">
                        <p>© 2023, Tots els drets reservats
                            <br>
                            <span>CEEG</span></p>
                        <p><a href="#" target="_blank">INFO</a></p>
                    </div>
                </footer>
            </div>
        </body>
    </html>
