<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Nou Equip</title>
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

            <!-- ACTION FORM PER CREAR EQUIP --> 
            <form:form modelAttribute="formNouEquip" class="form-horizontal" action="nouEquip">
                <fieldset>
                    <legend>Afegir equip</legend>
                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="codi">
                            Codi:
                        </label>
                        <div class="col-lg-10">
                            <form:input id="codi" path="codi" type="text" class="form-control input-lg"/>
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
                            <form:select path="estat" class="form-control input-lg">
                                <form:option value="Stock">Stock</form:option>
                            </form:select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">

                            <!-- Boto desar:   Actuarà sobre el controller EquipController.java passant param desar -->
                            <input type="submit" id="btnAdd" class="btn btn-primary" value ="Desar" name="desar"  onclick="return validaFormulari();"/>
                        </div>
                    </div>
                </fieldset>
            </form:form>

        </section>


        <script src="<c:url value="/resources/js/formulariEquip.js" />"></script>
    </body>
</html>
