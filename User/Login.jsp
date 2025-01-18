<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

        .form-container {
            background: linear-gradient(to bottom, #34495e, #2c3e50); /* Dark Urban Gradient */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            width: 400px;
        }

        .form-container h2 {
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

        input[type="text"], input[type="password"] {
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

        input[type="text"]:focus, input[type="password"]:focus {
            border: 2px solid #3498db; /* Bright Blue */
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        input[type="submit"], input[type="reset"], .register-button {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            color: #ffffff; /* White text */
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"] {
            background: #3498db; /* Bright Blue */
        }

        input[type="reset"] {
            background: #e74c3c; /* Red */
        }

        .register-button {
            background: #27ae60; /* Green */
            text-decoration: none;
            text-align: center;
        }

        input[type="submit"]:hover {
            background: #2980b9; /* Darker Blue */
            transform: scale(1.05);
        }

        input[type="reset"]:hover {
            background: #c0392b; /* Darker Red */
            transform: scale(1.05);
        }

        .register-button:hover {
            background: #1e8449; /* Darker Green */
            transform: scale(1.05);
        }

        .error-message {
            color: #e74c3c; /* Red */
            font-size: 0.9em;
            margin-bottom: 15px;
        }

        .button-group a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Urban Mobility Login</h2>

        <!-- Display error message if any -->
        <% if(request.getAttribute("errMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errMessage") %>
            </div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="type">Type</label>
                User<input type="radio" name="Type" value="User" />
                Driver<input type="radio" name="Type" value="Driver" />
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="button-group">
                <input type="submit" value="Login">
                <input type="reset" value="Reset">
            </div>
        </form>
        <div style="margin-top: 15px;">
            <a href="Register.jsp" class="register-button">Register</a>
        </div>
    </div>
</body>
</html>