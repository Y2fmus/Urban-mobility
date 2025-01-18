
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/Transport2" user="app" password="app"/>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Urban Mobility Dashboard</title>
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

        /* Header */
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            font-size: 24px;
        }
        .header .user-info {
            display: flex;
            align-items: center;
        }
        .header .user-info img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-left: 10px;
        }

        /* Layout */
        .layout {
            display: flex;
            flex: 1;
        }

        /* Sidebar */
        .sidebar {
            background-color: #343a40;
            color: white;
            width: 250px;
            display: flex;
            flex-direction: column;
            padding: 20px 10px;
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
            background-color: #495057;
            transform: scale(1.05);
        }
        .sidebar a.active {
            background-color: #007bff;
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
            margin-left: 30px; /* Added space for sidebar */
            padding: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 1000px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            flex-grow: 1;
            margin-top: 20px; /* Added space at the top */
        }

        /* Profile Card */
        .profile-card {
            width: 100%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .profile-card h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }

        .profile-card table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .profile-card th, .profile-card td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .profile-card th {
            background-color: #f8f9fa;
        }

        .profile-card input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px;
            background-color: #f8f9fa;
        }

        .profile-card input[type="password"]:disabled {
            background-color: #e9ecef;
        }

        .profile-card input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 20px;
        }

        .profile-card input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .layout {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                flex-direction: row;
                justify-content: space-around;
            }
            .main-content {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%
    String username = request.getParameter("Username");
    String userIdString = request.getParameter("Userid");
    
    int userid = 0;
    try {
        userid = Integer.parseInt(userIdString);
    } catch (NumberFormatException e) {
        out.println("<h2>Error: Invalid User ID provided.</h2>");
        return;
    }

    if (username == null || username.isEmpty()) {
        out.println("<h2>Error: Username is missing.</h2>");
        return;
    }
%>
    

    
    <div class="header">
        <h1>Urban Mobility Dashboard</h1>
        <div class="user-info">
            <h1>Welcome, <%= username %>,<%= userid%></h1>
        </div>
    </div>

    <div class="layout">
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="#" class="" onclick="showSection('profile')"><i class="fas fa-user"></i> Profile</a>
            <a href="#" onclick="showSection('schedule')"><i class="fas fa-bus"></i> Bus Schedule</a>
            <a href="Booking.jsp?username=${Username}&userid=${userid}" class="active"><i class="fas fa-bus"></i> Book Taxi</a>
            <a href="" onclick="showSection('payment')"><i class="fas fa-history"></i> Payment History</a>
            <button class="logout-btn" onclick="window.location.href='login.jsp'">Log Out</button>
        </div>
        <div class="main-content">
            <div class="profile-card">
            <h1>User Profile</h1>
            <form action="UpdateProfileServlet" method="post">
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM APP.USER2 WHERE UserID = <%= userid %>
                </sql:query>
                
                <table>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Password</th>
                    </tr>

                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td><c:out value="${row.UserID}"/></td>
                            <td><c:out value="${row.Username}"/></td>
                            <td><c:out value="${row.Email}"/></td>
                            <td><c:out value="${row.UserPhone}"/></td>
                            <td><c:out value="${row.password}"/></td>
                        </tr>
                   
                </table>
                <a href="EditUserProfile.jsp?Username=<%=username%>&Userid=<%=userid%>&Email=${row.Email}&password=${row.password}&UserPhone=${row.UserPhone}" class="button">Edit Profile</a>
                 </c:forEach>
            </form>
        </div>

        </div>
    </div>
</body>
</html>

