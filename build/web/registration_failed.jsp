<%--
    Document   : index
    Created on : 9/11/2021, 02:50:48
    Author     : mfer_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--iconos fontawesome-->
    <script src="https://kit.fontawesome.com/ac17241314.js" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <!-- cistom css-->
  <link href="css/estiloslogin.css" rel="stylesheet" type="text/css" />
    <!--logo icon-->
  <link rel="icon" type="" href="img/header/bag-shopping-blue-solid.png">
    <title>Punto de Venta</title>
</head>

<body>
    <div class="container">
        <div class="forms-container">
          <div class="signin-signup">
            <form action="sr_login" metod="post" class="sign-in-form">

              <h2 class="title">Sign in</h2>
              <div class="input-field">
                <i class="fas fa-user"></i>
<!--                <input type="text" placeholder="Usuario" />-->
                 <input type="text" placeholder="Usuario" name="txt_email" required>
              </div>
              <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Contraseña" name="txt_password" required>
<!--                <input type="password" placeholder="Password" />-->
              </div>
              <!-- <input type="submit" value="Login" class="btn solid" /> -->
              <button name="btn_Ingresar" value="Ingresar" class="btn solid">Ingresar</button>
<!--              <button name="btn_Ingresar" value="Ingresar" class="btn solid">Ingresar</button>-->
              
            </form>
            <!--registrar nueva cuenta-->
            <form id="formLogin" action="sr_login" method="post" class="sign-up-form">
              <h2 class="title">Sign up</h2>
              <div class="input-field">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Usuario" />
              </div>
              <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password"  name="txt_password" id="txt_password"/>
              </div>
              <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="txt_password2" id="txt_password2" />
              </div>
              <!-- <input type="submit" class="btn" value="Sign up" /> -->
              <input type="submit" name="btn_Registrar" value="Registrar" value="Registrar" class="btn">
              <p>Recuerda ingresar la misma contraseña <i class="fas fa-lock"></i> dos veces</p>
            </form>
          </div>
        </div>
  
        <div class="panels-container">
          <div class="panel left-panel">
            <div class="content">
              <h3>Aun no tienes cuenta?</h3>
              <p>
                Crea una pinchando aqui!
              </p>
              <button class="btn transparent" id="sign-up-btn">
                Crear cuenta
              </button>
            </div>
              <img src="images/undraw_login.svg" class="image" alt="" />
          </div>
          <div class="panel right-panel">
            <div class="content">
              <h3>Perteneces a nosotros?</h3>
              <p>
                Inicia sesion pinchando aqui!
              </p>
              <button class="btn transparent" id="sign-in-btn">
                Iniciar sesion
              </button>
            </div>
              <img src="images/undraw_secure.svg" class="image" alt="" />
          </div>
        </div>
      </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
    <script src="js/app.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/sweetAlertFail.js"></script>
</body>

</html>

