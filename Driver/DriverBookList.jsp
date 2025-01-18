<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/Transport2" user="app" password="app"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Urban Mobility Dashboard</title>
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
        main-containt{
            flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
        margin: auto;
        max-width: 800px;
        background: #ffffff;
        border-radius: 15px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        text-align: center;
        }
        table {
        width: 90%;  /* Increase the table width to 90% of the page */
        margin: 20px auto;  /* Center the table horizontally */
        border-collapse: collapse;
        background-color: #f9f9f9;  /* Light background for contrast */
    }

    table, th, td {
        border: 1px solid #007bff;  /* Blue border */
        text-align: left;
    }

    th, td {
        padding: 12px;
    }

    th {
        background-color: #007bff;  /* Blue header background */
        color: white;  /* White text on the blue header */
    }

    td {
        background-color: #e9f2ff;  /* Light blue background for table data */
    }

    td:hover {
        background-color: #d0e7ff;  /* Slightly darker blue when hovering over data */
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
    String Drivername = request.getParameter("Username");
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
            <a href="#" class="active" onclick="showSection('profile')"><i class="fas fa-user"></i> Profile</a>
            <a href="#" onclick="showSection('schedule')"><i class="fas fa-bus"></i> Bus Schedule</a>
            <a href="Booking.jsp?Username=<%=username%>&Userid=<%=userid%>"><i class="fas fa-taxi"></i> Book Taxi</a>
            <a href="" onclick="showSection('payment')"><i class="fas fa-history"></i> Payment History</a>
            <button class="logout-btn" onclick="window.location.href='LoginUrban.jsp'">Log Out</button>
        </div>
        <div class="main-content">
            <sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM APP.Booking WHERE UserID=<%=userid%>
</sql:query>

<table>
    <tr>
        <th>BookingID</th>
        <th>UserID</th>
        <th>Pickup</th>
        <th>Destination</th>
        <th>Price</th>
        <th>Payment Status</th>
        <th>Date</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.BookingID}"/></td>
            <td><c:out value="${row.UserID}"/></td>
            <td><c:out value="${row.Pickup}"/></td>
            <td><c:out value="${row.Destination}"/></td>
            <td><c:out value="${row.price}"/></td>
            <td><c:out value="${row.PaymentStatus}"/></td>
            <td><c:out value="${row.BookingDate}"/></td>
        </tr>
    </c:forEach>
</table>

            
        </div>
    </div>

    <script>
        function showSection(sectionId) {
            document.querySelectorAll('.card').forEach(card => {
                card.style.display = 'none';
            });
            document.querySelectorAll('.sidebar a').forEach(link => {
                link.classList.remove('active');
            });
            document.getElementById(sectionId).style.display = 'block';
            document.querySelector(.sidebar a[onclick="showSection('${sectionId}')"]).classList.add('active');
        }
        document.getElementById('profile').style.display = 'block';

   
    </script>
</body>
</html>