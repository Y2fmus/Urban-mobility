<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" 
    url="jdbc:derby://localhost:1527/Transport2" user="app" password="app"/>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Schedule</title>
    <style>
        /* Reset and base styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: #eaf5ea;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .header {
            background: linear-gradient(135deg, #28a745, #72c47b);
            color: white;
            padding: 20px;
            width: 100%;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 32px;
            font-weight: bold;
        }

        .user-info h1 {
            font-size: 18px;
            margin-top: 10px;
        }

        .layout {
            display: flex;
            margin-top: 20px;
            width: 90%;
            max-width: 1200px;
        }

        /* Sidebar */
        .sidebar {
            background-color: #28a745;
            color: white;
            width: 250px;
            display: flex;
            flex-direction: column;
            padding: 20px 10px;
            border-radius: 10px;
        }

        .sidebar h2 {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        .sidebar a:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .sidebar a.active {
            background-color: #1e7e34;
        }

        .logout-btn {
            margin-top: auto;
            background-color: #dc3545;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            background-color: white;
            margin-left: 30px;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .main-content h2 {
            font-size: 24px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 60px 0;
        }

        table th, table td {
            border: 1px solid #dcdde1;
            padding: 10px 15px;
            text-align: center;
            font-size: 14px;
        }

        table th {
            background-color: #28a745;
            color: #ffffff;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        table tr:nth-child(odd) {
            background-color: #eaf5ea;
        }

        table tr:hover {
            background-color: #c3e6cb;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<%
    int DI = 0;
    String DN = null;
    String Drivername = request.getParameter("Drivername");
    String DriverIdString = request.getParameter("Driverid");
    if (Drivername == null && DriverIdString == null) {
        DN = (String) request.getAttribute("Drivername");
        DI = (Integer) request.getAttribute("Driverid");
    } else {
        try {
            DI = Integer.parseInt(DriverIdString);
        } catch (NumberFormatException e) {
            out.println("<h2>Error: Invalid Driver ID provided.</h2>");
            return;
        }

        if (Drivername == null || Drivername.isEmpty()) {
            out.println("<h2>Error: Drivername is missing.</h2>");
            return;
        }
        DN = Drivername;
    }
%>

<div class="header">
    <h1>Urban Mobility Dashboard</h1>
    <div class="user-info">
        <h1>Welcome, <%= DN %>, <%= DI %></h1>
    </div>
</div>

<div class="layout">
    <div class="sidebar">
        <h2>Menu</h2>
        <a href="DriverProfile2.jsp?Username=<%= DN %>&Userid=<%= DI %>" class="active"><i class="fas fa-user"></i> Profile</a>
        <a href="DriverBusSchedule.jsp?Drivername=<%= DN %>&Driverid=<%= DI %>" class=""><i class="fas fa-bus"></i> Bus Schedule</a>
        <a href="Booking.jsp?username=${Username}&userid=${userid}" class=""><i class="fas fa-taxi"></i> Book Taxi</a>
        <a href="" onclick="showSection('payment')"><i class="fas fa-history"></i> Payment History</a>
        <button class="logout-btn" onclick="window.location.href='login.jsp'">Log Out</button>
    </div>
    <div class="main-content">
        <h2>Rapid Bus Schedule in Selangor</h2>

        <!-- Querying the database -->
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM UNTITLED ORDER BY NUMBER
        </sql:query>

        <!-- Rendering the table dynamically -->
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Route</th>
                    <th>Start Point</th>
                    <th>End Point</th>
                    <th>Bus Start Time</th>
                    <th>Bus End Time</th>
                    <th>Average Frequency (Min)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td>${row.Number}</td>
                        <td>${row.Route}</td>
                        <td>${row.StartPoint}</td>
                        <td>${row.EndPoint}</td>
                        <td>${row.StartTime}</td>
                        <td>${row.EndTime}</td>
                        <td>${row.AverageArrivedTime}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
