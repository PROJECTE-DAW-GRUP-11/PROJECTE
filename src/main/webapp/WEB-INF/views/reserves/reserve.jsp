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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>Reserva</title>
        <style>

            thead{
                background-color: gainsboro;
                margin: 5px;
                font-size:calc(0.4em + 0.4vw);


            }
            td{
                margin: 15px;
                padding: 15px;
                border:  black 1px solid;

            }
            option,h3,legend{
                justify-content: center;
                text-align:center;
            }
            #mytable{
                margin-top: 20px;
                border-collapse: separate;
                border-spacing:  5px;
                table-layout: fixed;
                width: 100%;
            }
            #reservesSala{
                display: none;
            }
            #formReserve{
                justify-content: left;
                width: 100%;
            }
            .titulo{
                font-size:calc(0.4em + 0.4vw);

                width: 20%;
                border:none;
                background-color: gainsboro;
                font-weight: bold;
            }
            .navbar-brand img {
                width: 95px;
                height: auto;
                margin-top: -8px;
            }
        </style>
        <script src="<c:url value="/resources/js/reserves.js" />"></script>
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
        <section>
            <div class="jumbotron">
                <div class="container">
                    <img class="img-responsive" src="/PROJECTE/resources/img/logo_g.png"  width="50" height="100" align="left" style="margin-right:20px"/>
                    <h2 class="ml-2">Reserva d'espais </h2>
                </div>
            </div>    
            
            <h3><a href="<spring:url value='/espais/espai?codi=${idsala}'/>">${idsala}</a></h3>

            <div class="container" style="margin-top:65px">
                <select  id="setmanes" class="form-control input-lg" onchange="reservesSetmana()">

                    <option value="Setmanes">Setmanes</option>
                    <c:forEach begin="1" step="1" end="52" var="variable">
                        <option value="${variable}">${variable}</option>
                    </c:forEach>
                </select>
        </section>
            <br>

        <section class="container">
            <div class="table-responsive">
                <table  id="mytable" class="table">
                    <thead class="thead-dark">
                    <th style="background-color:white;"class="titulo"  scope="col"></th>
                    <th class="text-center" scope="col">8</th>
                    <th class="text-center" scope="col">9</th>
                    <th class="text-center" scope="col">10</th>
                    <th class="text-center" scope="col">11</th>
                    <th class="text-center" scope="col">12</th>
                    <th class="text-center" scope="col">13</th>
                    <th class="text-center" scope="col">14</th>
                    <th class="text-center" scope="col">15</th>
                    <th class="text-center" scope="col">16</th>
                    <th class="text-center" scope="col">17</th>
                    <th class="text-center" scope="col">18</th>
                    <th class="text-center" scope="col">19</th>
                    </thead>       

                    <tr scope="row" class="table-row-link" id="dilluns" name="dilluns">
                        <td class="titulo" dia="dilluns">Dilluns</td>
                        <td hora="8"></td>
                        <td hora="9"></td>
                        <td hora="10"></td>
                        <td hora="11"></td>
                        <td hora="12"></td>
                        <td hora="13"></td>
                        <td hora="14"></td>
                        <td hora="15"></td>
                        <td hora="16"></td>
                        <td hora="17"></td>
                        <td hora="18"></td>
                        <td hora="19"></td>
                    </tr>
                    <tr scope="row" class="table-row-link" id="dimarts" name="dimarts">
                        <td class="titulo" dia="dimarts">Dimarts</td>
                        <td hora="8"></td>
                        <td hora="9"></td>
                        <td hora="10"></td>
                        <td hora="11"></td>
                        <td hora="12"></td>
                        <td hora="13"></td>
                        <td hora="14"></td>
                        <td hora="15"></td>
                        <td hora="16"></td>
                        <td hora="17"></td>
                        <td hora="18"></td>
                        <td hora="19"></td>
                    </tr>
                    <tr scope="row" class="table-row-link" id="dimecres" name="dimecres">
                        <td class="titulo" dia="dimecres">Dimecres</td>
                        <td hora="8"></td>
                        <td hora="9"></td>
                        <td hora="10"></td>
                        <td hora="11"></td>
                        <td hora="12"></td>
                        <td hora="13"></td>
                        <td hora="14"></td>
                        <td hora="15"></td>
                        <td hora="16"></td>
                        <td hora="17"></td>
                        <td hora="18"></td>
                        <td hora="19"></td>
                    </tr>
                    <tr scope="row" class="table-row-link" id="dijous" name="dijous">
                        <td class="titulo" dia="dijous">Dijous</td>
                        <td hora="8"></td>
                        <td hora="9"></td>
                        <td hora="10"></td>
                        <td hora="11"></td>
                        <td hora="12"></td>
                        <td hora="13"></td>
                        <td hora="14"></td>
                        <td hora="15"></td>
                        <td hora="16"></td>
                        <td hora="17"></td>
                        <td hora="18"></td>
                        <td hora="19"></td>
                    </tr>
                    <tr scope="row" class="table-row-link" id="divendres" name="divendres">
                        <td class="titulo" dia="divendres">Divendres</td>
                        <td hora="8"></td>
                        <td hora="9"></td>
                        <td hora="10"></td>
                        <td hora="11"></td>
                        <td hora="12"></td>
                        <td hora="13"></td>
                        <td hora="14"></td>
                        <td hora="15"></td>
                        <td hora="16"></td>
                        <td hora="17"></td>
                        <td hora="18"></td>
                        <td hora="19"></td>
                    </tr>
                </table>
            </div>
        </section>

        <section>  
            <div class="container-fluid">

                <form  id="formReserve" action="<spring:url value= '/reserves/reserveNova'/>" method="POST" >
                    <fieldset>
                        <div class="container" style="margin-top:65px">
                            <h3><b>Nova reserva</b></h3>

                            <input class="invisible" id="idusuari" name="idusuari" value="<%= session.getAttribute("id")%>"  path="idusuari"  />

                            <input class="invisible" id="idsala" name="idsala" path="idSala" value="${idsala}"/>

                            <input class="invisible" id="setmana" path="setmana" value="" name="setmana"/>

                            <select class="form-control input-lg"" id="selDia" path="dia" name="dia" onchange="comprobarDisponibilidad()">
                            <option value="dia">Dia</option>
                            <option value="dilluns">dilluns</option>
                            <option value="dimarts">dimarts</option>
                            <option value="dimecres">dimecres</option>
                            <option value="dijous">dijous</option>
                            <option value="divendres">divendres</option>
                            </select>
                            <br>
                            <select class="form-control input-lg" id="selHora" path="hora" name="hora" onchange="comprobarDisponibilidad()">
                                <option value="hora">Hora</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                            </select>
                            <br>
                            <select class="form-control input-lg" id="selTemps" path="temps" name="temps" onchange="comprobarDisponibilidad()">
                                <option value="temps">Temps</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select>
                            <br>


                            <input type="submit" id="btnAdd" class="btn btn-primary" value ="Reservar"  onclick="return validaFormulari();"/>

                            </form:form>

                        </div>

                        </div>
                        </section>






                        <table id="reservesSala">
                            <c:forEach items="${reserves}" var="reserve">
                                <tr> 
                                    <td setmana="${reserve.setmana}" dia="${reserve.dia}" hora="${reserve.hora}" temps="${reserve.temps}"></td>            
                                </tr>
                            </c:forEach>
                        </table>
                        <a value="<%session.getAttribute("reserves");%>"></a>
                        <a href="javascript:window.history.back()" style="display: flex; justify-content: center; align-items: center;">
                            <img src="/PROJECTE/resources/img/fletxa_2.svg" alt="Logo" style="width: 90px;">
                        </a>

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
