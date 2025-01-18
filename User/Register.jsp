<%-- 
    Document   : RegisterUrban
    Created on : Jan 11, 2025, 4:39:54 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #2c3e50, #2980b9); /* Urban Blue Gradient */
            color: #ffffff; /* White Font */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background: linear-gradient(to bottom, #34495e, #2c3e50); /* Dark Urban Gradient */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            width: 400px;
        }

        .register-container h2 {
            margin-bottom: 20px;
            color: #ecf0f1; /* Light Gray */
            font-size: 1.8em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #ecf0f1; /* Light Gray Font */
        }

        input[type="text"], input[type="email"], input[type="tel"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #ecf0f1; /* Light background */
            color: #2c3e50; /* Dark text */
            font-size: 1em;
            box-sizing: border-box;
            outline: none;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="tel"]:focus, input[type="password"]:focus, select:focus {
            border: 2px solid #3498db; /* Bright Blue */
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            color: #ffffff; /* White text */
            background: #27ae60; /* Green Button */
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: #1e8449; /* Darker Green */
            transform: scale(1.05);
        }

        select {
            appearance: none;
            background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"%3E%3Cpath fill="%23000" d="M2 0L0 2h4zM0 3l2 2 2-2z"/%3E%3C/svg%3E');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 10px 10px;
        }
        
        .back-button {
            background: #3498db; /* red */
            text-decoration: none;
            text-align: center;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            color: #ffffff; /* White text */
        }
        
        .back-button:hover {
            background: #0056b3; /* Darker Blue */
            transform: scale(1.05);
        }
        
        
    </style>
</head>
<body>

<div class="register-container">
    <h2>Register</h2>
    <form action="RegisterServlet" method="POST">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="form-group">
            <label for="userType">Type:</label>
            <select id="userType" name="userType" required>
                <option value="">--Select--</option>
                <option value="User">User</option>
                <option value="Admin">Admin</option>
                <option value="Driver">Driver</option>
            </select>
        </div>
        <button type="submit">Register</button>
    </form>
    <div style="margin-top: 15px;">
        <a href="Login.jsp" class="back-button">Back</a>
    </div>
</div>

</body>
</html>