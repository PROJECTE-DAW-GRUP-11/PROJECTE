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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
         <!-- Select2 -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <title>Reserves</title>

        <style>
 
            /*RESALTA AL PASSAR PER SOBRE UNA FILA */
         
            option{
                text-align:center;
            }
            thead{
                background-color: greenyellow;
                margin: 5px;
                border: 1px;
            }
            .llista_reserves{
                margin-top: 20px;
            }
            #btnReservar{
                 margin-top: 20px;
                 justify-content: center;
            }
        </style>
        <script src="<c:url value="/resources/js/reserves.js" />"></script>
    </head>
    <body>

        <!-- MENU -->

          <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Navegacío</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><span class="h2 text-center">geec</span></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    
                    <ul class="nav navbar-nav"> 
                          <li>
                            <a href="<spring:url value= '/usuaris/usuari'/>">Inici</a>
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
                    <h1 class="ml-2">Reserves</h1>
                </div>
            </div>
        </section>

 <section class="container">
        
        <form  class="form-horizontal" action="<spring:url value= '/reserves/reservesSala'/>">
                <fieldset>
                    <legend>Reservar sala </legend>
                  
                        <div class="col-lg-10">
                            <select id="idsala" class="form-control input-lg">
                                <option value="Sales">SALES</option>
                                  <c:forEach items="${sales}" var="sala">

                                <option value="${sala.codi}">${sala.codi}</option>
                                 </c:forEach>
                            <select>
                        </div>
                  
                    <div>
                            <input  type="submit" id="btnReservar" class="btn btn-primary" class="form-control input-lg" value ="Reservar" name="idsala" onclick="return myFunction();" />
</div>
                </fieldset>
            </form>
        

              </section>      
                    

             <section  id="llista_reserves" class="container">
                 <h3>llista de reserves</h3>
                 <p>
            <div class="table-responsive">
                <table id="mytable" class="table">
                    <thead class="thead-dark">

                    <th class="text-center" scope="col">Id Reserve</th>
                    <th class="text-center" scope="col">
                    
                    <SELECT class="js-example-basic-single" id="selSala" style="width:50%" onchange="selFunction()">
                            <OPTION>Id Sala</OPTION>
                           <c:forEach var="reserve" items="${reservesusuari}" varStatus="status">
        <c:set var="reserveAlreadyExists" value="${false}" />
        <c:if test="${(status.index - 1) >= 0}">
            <c:forEach var="previousReserve" items="${reservesusuari}" begin="0" end="${status.index - 1}" varStatus="inner">
                <c:if test="${reserve.idSala == previousReserve.idSala}">
                    <c:set var="reserveAlreadyExists" value="${true}" />
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${not reserveAlreadyExists}">
            <option value="${status.index}">${reserve.idSala}</option>
        </c:if>
    </c:forEach>
                            </SELECT>
 
                    </th>
                    
                    <th class="text-center" scope="col">
                         <SELECT class="js-example-basic-single" id="selSetmana" style="width:50%" onchange="selFunction()">
                            <OPTION>Setmana</OPTION>
                           <c:forEach var="reserve" items="${reservesusuari}" varStatus="status">
        <c:set var="reserveAlreadyExists" value="${false}" />
        <c:if test="${(status.index - 1) >= 0}">
            <c:forEach var="previousReserve" items="${reservesusuari}" begin="0" end="${status.index - 1}" varStatus="inner">
                <c:if test="${reserve.setmana == previousReserve.setmana}">
                    <c:set var="reserveAlreadyExists" value="${true}" />
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${not reserveAlreadyExists}">
            <option value="${status.index}">${reserve.setmana}</option>
        </c:if>
    </c:forEach>
                            </SELECT>
 
                        
                        
                        
                        
                        </th>
                    <th class="text-center" scope="col">Dia</th>
                    <th class="text-center" scope="col">Hora</th>
                    <th class="text-center" scope="col">Temps</th>
                   

                    </thead>                  
                    <c:forEach items="${reservesusuari}" var="reserve">
                        <tr scope="row" class="table-row-link" id="fila" >
                        
                            <td class="text-center"> ${reserve.idReserve}</td>
                            <td class="text-center">${reserve.idSala}</td>
                            <td class="text-center"> ${reserve.setmana}</td>
                            <td class="text-center"> ${reserve.dia}</td>
                            <td class="text-center"> ${reserve.hora}</td>
                            <td class="text-center"> ${reserve.temps}</td>
                          
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
