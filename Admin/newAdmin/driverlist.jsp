<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="myDatasource"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/Transport2"
    user="app"
    password="app" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Drivers</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
       body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
            color: #333;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .layout {
            display: flex;
            flex: 1;
        }
        .sidebar {
            background-color: #343a40;
            color: white;
            width: 250px;
            display: flex;
            flex-direction: column;
            padding: 20px 10px;
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
        .sidebar a:hover {
            background-color: #495057;
            transform: scale(1.05);
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        .delete-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .delete-button:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }
    </style>
    <% 
        String DN = request.getParameter("Adminname");
        String DI = request.getParameter("adminid");

        if (DN == null || DI == null) {
            DN = (String) request.getAttribute("Adminname");
            DI = String.valueOf(request.getAttribute("adminid"));
        }
    %>
</head>
<body>
    <div class="header">
        <h1>Urban Mobility Dashboard</h1>
        <div class="user-info">
            <h1>Welcome, <%= DN %>, <%= DI %></h1>
        </div>
    </div>
    <div class="layout">
        <div class="sidebar">
            <a href="AdminDashboard.jsp?Adminname=<%= DN %>&adminid=<%= DI %>"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
        <div class="main-content">
            <h2>Manage Drivers</h2>
            <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM DRIVER
            </sql:query>
            <table border="1" cellspacing="2" cellpadding="10">
                <thead>
                    <tr>
                        <th>Driver ID</th>
                        <th>Driver Name</th>
                        <th>License</th>
                        <th>Phone Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td><c:out value="${row.DRIVERID}" /></td>
                            <td><c:out value="${row.DRIVERNAME}" /></td>
                            <td><c:out value="${row.LICENSE}" /></td>
                            <td><c:out value="${row.DRIVERPHONE}" /></td>
                            <td>
                                <form action="UpdateDriverServlet" method="post">
                                    <input type="hidden" name="id" value="${row.DRIVERID}" />
                                    <input type="hidden" name="type" value="driver" />
                                    <input type="hidden" name="Adminname" value="<%= DN %>" />
                                    <input type="hidden" name="adminid" value="<%= DI %>" />
                                    <input type="submit" value="Delete" style="color: red;" />
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
