<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ca">
    <head>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap');

            * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
            }

            #container {
                    width: 100%;
                    height: 100%;
                    z-index: 0;
                    position: absolute;
                    visibility: visible;
                    border: none;
                    background-color: #ffffff;
                    font-family: 'Roboto', sans-serif;
                    font-weight: bold;
                    color: rgba(0, 113, 188, 1);
            }

            header {
                    height: 40%;
                    z-index: 1;
                    position: relative;
                    visibility: visible;
                    border: none;
            }

            #logotip {
                    width: auto;
                    height: 100%;
                    z-index: 2;
                    position: relative;
                    visibility: visible;
                    display: flex;
                    justify-content: center;
            }

            #dades {
                    width: 100%;
                    height: 100%;
                    top: -10%;
                    z-index: 1;
                    position: relative;
                    visibility: visible;
                    border: none;
                    margin: 0 auto;
                    display: flex;
                    justify-content: center;
            }

            #imatge {
                    width: 100%;
                    height: 100%;
                    position: relative;
                    z-index: 2;
                    align-items: center;
                    display: flex;
                    background-image: url("/PROJECTE/resources/img/user.svg");
                    background-repeat: no-repeat;
                    background-position: 50% 0%;
                    background-size: auto;
                    margin-left: auto;
                    margin-right: auto;
                    border: none;
            }

            .formulari {
                    background-color: #ffffff;
                    margin: auto;
                    width: 70%;
                    max-width: 300px;
                    padding: .5em .5em;
                    text-align: center;
                    height: auto;
                    max-height: 200px;
                    z-index: 2;
                    position: relative;
                    border: none;
                    box-sizing: border-box;
            }

            .formulari_container {
                    margin-top: .5em;
                    display: grid;
                    gap: 1.5em;
            }

            .formulari_grup {
                    position: relative;
                    --color: #22B573;
            }

            .formulari_etiqueta {
                    color: var(--color);
                    cursor: pointer;
                    position: absolute;
                    top: 0;
                    left: 5px;
                    transform: translateY(10px);
                    transition: transform 0.5s, color .3s;
            }

            .formulari_input {
                    width: 100%;
                    background: none;
                    font-size: 1rem;
                    padding: .6em .3em;
                    border: none;
                    outline: none;
                    border-bottom: 1px solid var(--color);
                    font-family: 'Roboto', sans-serif;
                    color: rgba(0, 113, 188, 1);
            }

            .formulari_input:focus+.formulari_etiqueta,
            .formulari_input:not(:placeholder-shown)+.formulari_etiqueta {
                    transform: translateY(-12px) scale(.7);
                    transform_origin: left top;
                    color: rgba(0, 113, 188, 1);
            }

            .formulari_boto {
                    background-color: rgba(0, 113, 188, 1);
                    background-image: linear-gradient(to right, rgba(0, 113, 188, 1), rgba(34, 181, 115, 1));
                    color: #ffffff;
                    font-family: 'Roboto', sans-serif;
                    font-weight: 300;
                    font-size: 1rem;
                    padding: .8em 0;
                    border: none;
                    border-radius: 20px;
            }

            .formulari_linia {
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 100%;
                    height: 2px;
                    background-color: rgba(0, 113, 188, 1);
                    transform: scale(0);
                    transform: left bottom;
                    transform: .4s;
            }

             @media (max-width: 470px) {
                #imatge {
                    background-image: url("");
                    margin: -200px;
                }
                
                #logotip {
                    width: auto;
                    height: 60%;
                    z-index: 3;
                    position: relative;
                    visibility: visible;
                    display: flex;
                    justify-content: center;
                }
            
            }
            
        </style>
            
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
        <title>Login</title>
    </head>
    <body>
        <div id="container">
            <header>
                <div id="logotip">
                    <img src="/PROJECTE/resources/img/logo.svg" alt="geek" />
                </div>
            </header>
            <div id="dades">
                <div id="imatge">
                    <form action="login" method="post" class="formulari">
                        <div class="formulari_container">
                            <div class="formulari_grup">
                               
                                <input type="text" class="formulari_input" id="idusuari" 
                                    name="idusuari" aria-describedby="text">
                                 <label for="idusuari" class="formulari_etiqueta">Usuari</label>
                                <span class="formulari_linia"></span>
                            </div>
                            <div class="formulari_grup">
                                <input type="password" class="formulari_input" id="password" 
                                    name="password" >
                                 <label for="paswsord" class="formulari_etiqueta">Password</label>
                                <span class="formulari_linia"></span>
                            </div>
                            <input name="entrar" type="submit" class="formulari_boto" value="Entrar"/>
                            <h4>${message}</h2><br/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>