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
            <title>Equip</title>
        </head>



        <body>

            <!-- MENU -->

            <div class="container">
                <div class="row">
                    <div class="col-md-8"></div>
                    <div class="col-md-4">  
                        <nav>
  
                        </nav>
                    </div>
                </div>
            </div>


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
                            <div id="espais" class="col-lg-10">                                  
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



            </section>

            <!-- JAVASCRIPT - Llegeix fitxer .js de la carpeta /resources/js/ --> 
            <script src="<c:url value="/resources/js/formulariEquip.js" />"></script>
        </body>
    </html>
