<%-- 
    Document   : index
    Created on : 7/11/2024, 9:12:55 a. m.
    Author     : IT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" width=device-width, initial-scale=1.0">
    <title>PROYECTO FINAL G5</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <style>
        .dropdown-submenu {
            position: relative;
        }
        .dropdown-submenu .dropdown-menu {
            left: 100%;
            top: 0;
            display: none;
        }
        .dropdown-submenu:hover .dropdown-menu {
            display: block;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
        
        .modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    z-index: 9999; /* Asegúrate de que el z-index sea mayor que el del iframe */
    display: flex;
    justify-content: center;
    align-items: center;
}


/* Contenido del modal */
.modal-content {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  width: 300px;
  box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
}

/* Estilo del título */
.modal-content h2 {
  font-size: 24px;
  margin-bottom: 20px;
  color: #333;
}

/* Estilo de las etiquetas y campos de entrada */
.modal-content label {
  margin-bottom: 8px;
  color: #555;
  font-size: 14px;
}

.modal-content input {
  width: 100%;
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 14px;
}

/* Estilo del botón de "Ingresar" */
.btn-submit {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
}

.btn-submit:hover {
  background-color: #0056b3;
}

/* Estilo del botón "Cerrar" */
.btn-close {
  margin-top: 15px;
  padding: 8px 15px;
  background-color: #dc3545;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.btn-close:hover {
  background-color: #c82333;
}

/* Estilo del mensaje de error */
#errorMsg {
  font-size: 12px;
  margin-top: 10px;
  color: red;
  text-align: center;
}
    </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #1e74a7;">
    <a class="navbar-brand" href="index.jsp" style="color: white;">INICIO</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                    PRODUCTOS
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="productos.jsp" target="FramePrincipal">EDITAR PRODUCTOS</a>
                    <a class="dropdown-item" href="marcas.jsp" target="FramePrincipal">EDITAR MARCAS</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                    VENTAS
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="ventas.jsp" target="FramePrincipal">EDITAR VENTAS</a>
                    <a class="dropdown-item" href="clientes.jsp" target="FramePrincipal">EDITAR CLIENTES</a>
                    <div class="dropdown-submenu">
                        <hr class="dropdown-divider">
                        <a class="dropdown-item dropdown-toggle">EMPLEADOS</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="empleados.jsp" target="FramePrincipal">EDITAR EMPLEADOS</a>
                            <a class="dropdown-item" href="puestos.jsp" target="FramePrincipal">EDITAR PUESTOS</a>
                            <a class="dropdown-item" onclick="openModal()">EDITAR USUARIOS</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                    COMPRAS
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="compras.jsp" target="FramePrincipal">EDITAR COMPRAS</a>
                    <a class="dropdown-item" href="proveedores.jsp" target="FramePrincipal">EDITAR PROVEEDORES</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="reportes.jsp" target="FramePrincipal" style="color: white;">REPORTES</a>
            </li>
        </ul>

        <div class="dropdown">
            <button class="btn dropdown-toggle" type="button" id="btnCerrarSesion" data-toggle="dropdown" aria-expanded="false" style="color: white;">
                LOGIN
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="btnCerrarSesion">
                <form action="sr_validar" method="POST">
                    <button class="dropdown-item text-danger" name="accion" value="cerrar" type="submit">
                        Cerrar Sesión
                    </button>
                </form>
            </ul>
        </div>
    </div>
</nav>

    
    <div class="m-4" style="height: 550px;">
    <iframe id="FramePrincipal" name="FramePrincipal" src="fondo.jsp" style="height:100%; width:100%; border:none"></iframe>
   </div>
    

<div id="loginModal" class="modal" style="display: none;" onclick="closeModalOutside(event)">
  <div class="modal-content" onclick="event.stopPropagation();">
    <h2></h2>
        <label style="center">*INICIA SESION</label>
        <label style="center">PARA MODIFICAR USUARIOS</label>
    <form id="loginForm" action="sr_validar_adm" method="post" target="FramePrincipal" onsubmit="return validarLogin(event)">
      <input type="text" name="usuario" placeholder="USUARIO" required>
      <input type="password" name="contrasena" placeholder="CONTRASEÑA" required>
      <button type="submit" class="btn-close" style="background-color: #1e74a7; border:none">Ingresar</button>
      <button type="button" onclick="closeModal()" class="btn-close" style="background-color: #1e74a7; border:none">Cerrar</button>
     <div id="errorMsg" style="color: red; display: none;">Credenciales incorrectas</div>
        </form>
  </div>
</div>
<script>
// Función para abrir el modal
    function openModal() {
        const modal = document.getElementById('loginModal');
        if (modal) {
            modal.style.display = 'block';  // Muestra el modal
        }
    }

    // Función para cerrar el modal al hacer clic fuera
//    function closeModalOutside(event) {
//        if (event.target === document.getElementById('loginModal')) {
 //           closeModal();
 //       }
//    }

    // Función para cerrar el modal
    function closeModal() {
        const modal = document.getElementById('loginModal');
        if (modal) {
            modal.style.display = 'none';  // Oculta el modal
        }
    }

    
document.addEventListener('DOMContentLoaded', function() {
    // Define la función validarLogin antes de usarla
    function validarLogin(event) {
        event.preventDefault();  // Evitar envío tradicional

        const usuario = document.querySelector('input[name="usuario"]').value;
        const contrasena = document.querySelector('input[name="contrasena"]').value;

        if (!usuario || !contrasena) {
            alert('Por favor, ingrese todos los campos.');
            return false;
        }

        const datos = new URLSearchParams();
        datos.append('usuario', usuario);
        datos.append('contrasena', contrasena);

        fetch('sr_validar_adm', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: datos.toString()
        })
        .then(response => response.text())
        .then(responseText => {
    console.log('Respuesta del servidor:', responseText);

    if (responseText.trim() === "success") {
        // Verificar que el iframe esté presente
        const iframe = document.getElementById("FramePrincipal");
        if (iframe) {
            // Asignar la URL de 'usuarios.jsp' al iframe
            iframe.src = 'usuarios.jsp';  // Cambia la URL aquí si es necesario
            iframe.onload = function() {
                console.log('La página usuarios.jsp se ha cargado correctamente en el iframe.');
            };
        } else {
            console.error("No se encontró el iframe con id 'FramePrincipal'");
        }

        // Cerrar el modal después de la validación exitosa
        closeModal();
    } else {
        // Mostrar mensaje de error
        const errorMsg = document.getElementById('errorMsg');
        errorMsg.style.display = 'block';  // Mostrar el mensaje de error
    }
})


        .catch(error => {
            console.error('Error en la autenticación:', error);
            alert('Ocurrió un error. Intenta de nuevo.');
        });

        return false;  // Evita que el formulario se envíe de forma tradicional
    }
    // Asociar el formulario al evento de validación
    const form = document.querySelector("#loginForm"); // Asegúrate de que este selector sea el correcto
    if (form) {
        form.addEventListener('submit', validarLogin);  // Asocia la función de validación al evento submit
    }
});

</script>
               
</body>
</html>
