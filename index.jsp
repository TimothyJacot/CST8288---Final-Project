<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to PTFMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #007bff, #00c6ff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .welcome-container {
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            backdrop-filter: blur(10px);
        }

        h1 {
            font-size: 36px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .links a {
            display: inline-block;
            margin: 0 15px;
            padding: 12px 24px;
            background-color: white;
            color: #007bff;
            font-weight: 600;
            text-decoration: none;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .links a:hover {
            background-color: #0056b3;
            color: white;
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 28px;
            }

            .links a {
                display: block;
                margin: 10px auto;
            }
        }
    </style>
</head>
<body>

<div class="welcome-container">
    <h1>Welcome to PTFMS</h1>
    <div class="links">
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </div>
</div>

</body>
</html>