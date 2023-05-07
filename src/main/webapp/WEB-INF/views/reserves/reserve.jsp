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
        <title>Reserve</title>
         <style>

            thead{
                background-color: gainsboro;
                 margin: 5px;
               
                
                
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
        
      
            }
            #reservesSala{
                display: none;
            }
            #formReserve{
                justify-content: center;
            }
            .titulo{
                border:none;
                background-color: white;
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
                    <a class="navbar-brand" href="#"><span class="h2 text-center">geec</span></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                           <a href="<spring:url value= '/reserves/llistar'/>?idusuari=<%= session.getAttribute("id")%>'">Retornar</a>
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
        <section>
            <div class="jumbotron">
                <div class="container">
                    <img class="img-responsive" src="/PROJECTE/resources/img/logo_g.png"  width="50" height="100" align="left" style="margin-right:20px"/>
                    <h2 class="ml-2">Usuari: Reservar </h2>
                </div>
            </div>    
            
            <h3><c:out value="${idsala}"></c:out>  </h3>
            <div class="container" style="margin-top:65px">
               
                 <select  id="setmanes" class="form-control input-lg" onchange="reservesSetmana()">

                       <option value="Setmanes">Setmanes</option>
                 <c:forEach begin="1" step="1" end="52" var="variable">
	                   <option value="${variable}">${variable}</option>
                              </c:forEach>
                                </select>
                   </section>
              
                  <section class="container">
            <div class="table-responsive">
                <table id="mytable" class="table">
               <thead>
                    <th class="titulo"  scope="col"></th>
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
                    
                    <tr scope="row" class="table-row-link" id="lunes" name="lunes">
                         <td class="titulo" dia="lunes">lunes</td>
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
                    <tr scope="row" class="table-row-link" id="martes" name="martes">
                       <td class="titulo" dia="martes">martes</td>
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
                    <tr scope="row" class="table-row-link" id="miercoles" name="miercoles">
                        <td class="titulo" dia="miercoles">miercoles</td>
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
                    <tr scope="row" class="table-row-link" id="jueves" name="jueves">
                        <td class="titulo" dia="jueves">jueves</td>
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
                    <tr scope="row" class="table-row-link" id="viernes" name="viernes">
                        <td class="titulo" dia="viernes">viernes</td>
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
            
            
             <form  id="formReserve" action="<spring:url value= '/reserves/reserveNova'/>" method="POST" >
                <fieldset>
                    <legend>Reserva Nova </legend>
                    
               
                            <input class="invisible" id="idusuari" name="idusuari" value="<%= session.getAttribute("id")%>"  path="idusuari"  />

                            <input class="invisible" id="idsala" name="idsala" path="idSala" value="${idsala}"/>

                            <input class="invisible" id="setmana" path="setmana" value="" name="setmana"/>
                     
                            <select id="selDia" path="dia" name="dia" onchange="comprobarDisponibilidad()">
                                <option value="dia">Dia</option>
                                <option value="lunes">lunes</option>
                                <option value="martes">martes</option>
                                <option value="miercoles">miercoles</option>
                                <option value="jueves">jueves</option>
                                <option value="viernes">viernes</option>
                            </select>
                      
                            <select id="selHora" path="hora" name="hora" onchange="comprobarDisponibilidad()">
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
                            
                            <select id="selTemps" path="temps" name="temps" onchange="comprobarDisponibilidad()">
                                <option value="temps">Temps</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                
                            <select>
        
                  
                            <input type="submit" id="btnAdd" class="btn btn-primary" value ="Reservar"  onclick="return validaFormulari();"/>
           
            </form:form>
     
                
                           
            
        
            <table id="reservesSala">
            <c:forEach items="${reserves}" var="reserve">
                <tr> 
                <td setmana="${reserve.setmana}" dia="${reserve.dia}" hora="${reserve.hora}" temps="${reserve.temps}"></td>            
                </tr>
                </c:forEach>
            </table>
            <a value="<%session.getAttribute("reserves"); %>"></a>    
         
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
