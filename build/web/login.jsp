<%-- 
    Document   : login
    Created on : 22/10/2024, 9:59:42?a. m.
    Author     : yeymi
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Proyecto Final</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #333, #000);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #1c1c1c;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            width: 350px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #ffffff;
            font-weight: 500;
        }

        .login-container input[type="text"], 
        .login-container input[type="password"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #444;
            border-radius: 30px;
            background-color: #2a2a2a;
            color: #ffffff;
            transition: all 0.3s;
        }

        .login-container input[type="text"]:focus, 
        .login-container input[type="password"]:focus {
            border-color: #ffffff;
            box-shadow: 0 0 5px rgba(255, 255, 255, 0.3);
            outline: none;
        }

        .login-container button {
            background-color: #000;
            color: white;
            padding: 15px;
            width: 100%;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 16px;
            font-weight: 500;
        }

        .login-container button:hover {
            background-color: #444;
            transform: translateY(-2px);
        }

        .error-message {
            color: #d9534f;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        
        <!-- Formulario de login -->
        <form action="sr_validar" method="POST">
            <input type="text" name="usuario" placeholder="Usuario" required><br>
            <input type="password" name="contrasena" placeholder="Contraseña" required><br>
            <button type="submit">Iniciar Sesión</button>
        </form>
        
        
        <%
            if (request.getParameter("error") != null) {
        %>
            <div class="error-message">
                Usuario o contraseña incorrectos.
            </div>
        <%
            }
        %>
    </div>
</body>
</html>

