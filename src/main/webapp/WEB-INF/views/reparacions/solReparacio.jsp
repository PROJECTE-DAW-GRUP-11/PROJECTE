<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
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
        <title>Sopl·licitud de reparació</title>
        
    </head>
    <body>
        <form action="enviar-reparacion.jsp" method="post">
            <fieldset>
                <legend>Sol·licitud de reparació</legend>
                
                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for="nom">Nom:</label>
                    <input class="form-control input-lg" type="text" id="nom" name="nom" 
                           value="<%= session.getAttribute("usuari")%> " disabled><br>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for="cognom">Nom:</label>
                    <input class="form-control input-lg" type="text" id="cognom" name="cognom" 
                           value="<%= session.getAttribute("cognoms")%>" disabled><br>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for="email">Adreça electrònica:</label>
                    <input class="form-control input-lg" type="email" id="email" name="email" 
                        value="<%= session.getAttribute("email")%> " disabled><br>
                </div>
                    
                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for="telefon">Telèfon</label>
                    <input class="form-control input-lg" type="tel" id="telefon" name="telefon"><br>
                    
                </div>

                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for="descripcio">Descripció de la incidència:</label><br>
                    <textarea class="form-control" id="descripcio" name="descripcio" rows="5" cols="50"></textarea><br>
                </div>
                
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <input class ="btn btn-primary" type="submit" value="Enviar">
                    </div>
                </div>                    
            </fieldset>
        </form>
    </body> 
</html>
