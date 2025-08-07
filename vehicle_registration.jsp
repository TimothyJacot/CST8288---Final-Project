<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(8px);
            width: 400px;
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #fff;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 8px;
            background-color: #f0f0f0;
            color: #333;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background-color: #00c6ff;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #008cc6;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Register a Vehicle</h2>
    <form action="VehicleServlet" method="post">
        <label for="type">Type:</label>
        <select name="type" id="type" required>
            <option value="Diesel Bus">Diesel Bus</option>
            <option value="Electric Light Rail">Electric Light Rail</option>
            <option value="Diesel-Electric Train">Diesel-Electric Train</option>
        </select>

        <label for="vehicleNumber">Vehicle Number:</label>
        <input type="text" name="vehicleNumber" id="vehicleNumber" required>

        <label for="fuelType">Fuel Type:</label>
        <input type="text" name="fuelType" id="fuelType" required>

        <label for="consumptionRate">Consumption Rate:</label>
        <input type="text" name="consumptionRate" id="consumptionRate" required>

        <label for="maxPassengers">Max Passengers:</label>
        <input type="text" name="maxPassengers" id="maxPassengers" required>

        <label for="assignedRoute">Assigned Route:</label>
        <input type="text" name="assignedRoute" id="assignedRoute" required>

        <input type="submit" value="Register Vehicle">
    </form>
</div>

</body>
</html>