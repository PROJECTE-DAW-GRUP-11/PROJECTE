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
            <title>Equip</title>
            <style>
            .navbar-brand img {
                width: 95px;
                height: auto;
                margin-top: -8px;
            }
        </style>
        </head>



        <body>

            <!-- MENU -->

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


            <!-- CONTAINER -->                                    
            <section class="container">
                <h1>${message}</h1>

                <!-- ACTION FORM PER ACTUALTIZAR EQUIP --> 
                <form:form modelAttribute="formEquip" class="form-horizontal" action="equip">
                    <fieldset>
                        <legend>Editar equip</legend>
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" for="codi">
                                Codi:
                            </label>
                            <div class="col-lg-10">
                                <form:input id="codi" path="codi" type="text" readonly="true" class="form-control input-lg"/>
                            </div>
                        </div>       
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" for="tipus">
                                Tipus
                            </label>
                            <div class="col-lg-10">
                                <form:select path="tipus" class="form-control input-lg">
                                    <form:option value="Pantalla">Pantalla</form:option>
                                    <form:option value="Dockstation">Dockstation</form:option>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" for="numserie">
                                Numero de serie:
                            </label>
                            <div class="col-lg-10">
                                <form:input id="numserie" path="numserie" type="text" class="form-control input-lg"/>
                            </div>
                        </div>  
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" for="marca">
                                Marca:
                            </label>
                            <div class="col-lg-10">
                                <form:input id="marca" path="marca" type="text" class="form-control input-lg"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" for="model">
                                Model:
                            </label>
                            <div class="col-lg-10">
                                <form:input id="model" path="model" type="text" class="form-control input-lg"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" for="estat">
                                Estat:
                            </label>
                            <div class="col-lg-10">
                                <form:select path="estat" id="estat" class="form-control input-lg">
                                    <form:option value="Servei">Servei</form:option>
                                    <form:option value="Stock">Stock</form:option>
                                    <form:option value="Reparacio" disabled="true">Reparació</form:option>
                                </form:select>
                            </div>
                        </div>
                            
                        <!-- Espais -->
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" >
                                Espai:
                            </label>
                            <div id="espai" class="col-lg-10">
                                <h3><a href="<spring:url value='/espais/espai?codi=${espaiAssignat}'/>">${espaiAssignat}</a></h3>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-lg-2" >
                               Llistat d'espais:
                            </label>
                            <div id="divEspais" class="col-lg-10">                                  
                                <select id="espais" name="espais" class="form-control input-lg">
                                    <c:forEach items="${espais}" var="espai">
                                        <option value="${espai.codi}">${espai.codi} - Planta:${espai.planta} - Zona: ${espai.zona} - Pos: ${espai.posicio}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>    





                        <!-- botons desar / eliminar -->

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">

                                <!-- Boto desar:   Actuarà sobre el controller EquipController.java passant param desar -->
                                <input type="submit" id="btnSave" class="btn btn-primary" value ="Desar" name="desar" onclick="return validaFormulari();"/>

                                <!-- Boto eliminar: Actuarà sobre el controller EquipController.java passant param eliminar
                                   Executarà la funció JavaScript confirmAction per mostrar missatge de SI/NO -->
                                <input type="submit" id="btnDelete" class="btn btn-primary" value ="Eliminar" name="eliminar" onclick="return confirmActionDelete();"/>
                            </div>
                        </div>




                    </fieldset>




                </form:form>

                <a href="javascript:window.history.back()" style="display: flex; justify-content: center; align-items: center;">
                    <img src="/PROJECTE/resources/img/fletxa_2.svg" alt="Logo" style="width: 90px;">
                </a>    

            </section>

            <!-- JAVASCRIPT - Llegeix fitxer .js de la carpeta /resources/js/ --> 
            <script src="<c:url value="/resources/js/formulariEquip.js" />"></script>
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
