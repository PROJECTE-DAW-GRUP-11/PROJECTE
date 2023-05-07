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
        <title>Nou Usuari</title>
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
            <!-- FORMULARI PER CREAR/ACTUALTIZAR USUARI --> 
            <form:form modelAttribute="formNouUsuari" class="form-horizontal" action="nouUsuari">
                <fieldset>
                    <legend>Afegir nou Usuari </legend>
                     <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="idUsuari">
                            idUsuari:
                        </label>
                        <div class="col-lg-10">
                            <form:input id="idUsuari" path="idUsuari" type="text" class="form-control input-lg"/>
                        </div>
                    </div>                        
                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="password">
                            Contrasenya:
                        </label>
                        <div class="col-lg-10">
                            <form:input  id="password" path="password" type="text" class="form-control input-lg"/>
                        </div>
                    </div>  
                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="nom">
                            Nom:
                        </label>
                        <div class="col-lg-10">
                            <form:input id="nom" path="nom" type="text" class="form-control input-lg"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="cognoms">
                            Cognoms:
                        </label>
                        <div class="col-lg-10">
                            <form:input id="cognoms" path="cognoms" type="text" class="form-control input-lg"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="email">
                            Email:
                        </label>
                        <div class="col-lg-10">
                            <form:input id="email" path="email" type="text" class="form-control input-lg"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="telefon">
                            Telefon
                        </label>
                        <div class="col-lg-10">
                            <form:input id="telefon" path="telefon" type="text" class="form-control input-lg"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="rol">
                            ROL:
                        </label>
                        <div class="col-lg-10 ">
                            <form:select path="rol" class="form-control input-lg">
                                <form:option value="Administrador">Administrador</form:option>
                                <form:option value="Tecnic">Tècnic</form:option>
                                <form:option value="Usuari">Usuari</form:option>
                            </form:select>
                        </div>
                    </div>
                        
                    <!-- BOTONS FORMULARI USUARIS --> 
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">

                            <!-- Boto desar:   Actuarà sobre el controller Controller.java passant param desar -->
                            <input type="submit" id="btnAdd" class="btn btn-primary" value ="Desar" name="desar" onclick="return validaFormulari();"/>

                            <!-- Boto eliminar: Actuarà sobre el controller Controller.java passant param eliminar
                                 - Executarà la funció JavaScript confirmAction per mostrar missatge de SI/NO 
                                 - Si es carega el formulari a la pàgina /usuaris/afegir, el botó d'eliminar quedarà deshabilitat. Això no passarà a la pàgina modificar
                            -->

                            
                        </div>
                    </div>
                </fieldset>
            </form:form>

        </section>




        <script src="<c:url value="/resources/js/formulariUsuari.js" />"></script>
    </body>
</html>
