<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      body {
        margin: 0;
        font-family: Arial, Helvetica, sans-serif;
      }

      .admin-side-navbar {
        height: 100%;
        width: 200px;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #111;
        overflow-x: hidden;
        padding-top: 20px;
      }

      .admin-side-navbar a {
        padding: 16px;
        text-decoration: none;
        font-size: 18px;
        color: white;
        display: block;
        margin-bottom: 50px; /* Added margin between anchor tags */
        margin-top: 60px;
      }

      .admin-side-navbar a:hover {
        background-color: #ddd;
        color: black;
      }

      .content {
        margin-left: 200px;
        padding: 16px;
      }
    </style>
    <title>Welcome to Blood Bank</title>
  </head>
  <body>
    <div class="admin-side-navbar">
      <a href="show_user_details.jsp">User Details</a>
      <a href="blood_donor_list.html">Blood Donor List</a>
      <a href="logout.html">Logout</a>
    </div>

    <div class="content">
      <!-- Your page content goes here -->
      <h1>ADMIN DASHBOARD</h1>
    </div>
  </body>
</html>
