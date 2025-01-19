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
            background-color: #6a0dad;
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
        background-color: #6a0dad;
        transform: scale(1.05);
    }
    .sidebar a.active {
        background-color: #6a0dad; /* Green active link background */
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
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .card {
            background: linear-gradient(135deg, #ffffff, #f1f3f4);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h2 {
            margin-bottom: 10px;
        }
        .card p {
            margin-bottom: 15px;
            color: #555;
        }
        .card button {
            background-color: #6a0dad;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .card button:hover {
            background-color: #6a0dad;
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
        int DI = 0;
        String DN=null;
        String Adminname = request.getParameter("Adminname");
        String AdminIdString = request.getParameter("adminid");
            if(Adminname==null&&AdminIdString==null){
                DN=(String) request.getAttribute("Adminname");
                DI = (Integer) request.getAttribute("adminid");
            }
        else{
            try {
                DI = Integer.parseInt(AdminIdString);
            }catch (NumberFormatException e) {
                out.println("<h2>Error: Invalid Driver ID provided.</h2>");
            return;
            }

            if (Adminname == null || Adminname.isEmpty()) {
                out.println("<h2>Error: Drivername is missing.</h2>");
                return;
            }
            DN=Adminname;
            }
    %>

    <div class="header">
        <h1>Urban Mobility Dashboard</h1>
        <div class="user-info">
            <h1>Welcome, <%= DN %>,<%= DI%></h1>
            
        </div>
    </div>
    <div class="layout">
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="#" class="" onclick="showSection('profile')"><i class="fas fa-user"></i> Profile</a>
            <a href="#" onclick="showSection('schedule')"><i class="fas fa-bus"></i> Bus Schedule</a>
            <a href="DriverBookList.jsp?Drivername=<%=DN%>&Driverid=<%=DI%>"><i class="fas fa-taxi"></i> Book List</a>
            <a href="" onclick="showSection('payment')"><i class="fas fa-history"></i> Payment History</a>
            <button class="logout-btn" onclick="window.location.href='LogoutServlet'">Log Out</button>
        </div>
        <div class="main-content">
            <div id="profile" class="card active-section">
                <h2>Profile</h2>
                <p>View and update your personal details, manage your account settings, and review your past activities.</p>
                <button>View Profile</button>
            </div>
            <div id="schedule" class="card">
                <h2>Bus Pickup Schedule</h2>
                <p>Check the schedule for upcoming bus pickups. You can also plan your trips based on available buses.</p>
                <button>View Schedule</button>
            </div>
            <div id="taxi" class="card">
                <h2>Book a Taxi</h2>
                <p>Need a ride? Book a Taxi car quickly and conveniently with just a few clicks.</p>
                <button>Book Now</button>
            </div>
            <div id="payment" class="card">
                <h2>Payment History</h2>
                <p>View your transaction history and manage your payments effectively.</p>
                <button>View Payments</button>
            </div>
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