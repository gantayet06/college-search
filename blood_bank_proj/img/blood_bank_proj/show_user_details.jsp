<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <!-- You can link your CSS file here if needed -->
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>
<body>

<%
    // JDBC Connection
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Dhanada@2002");

        // Retrieve all user details from the table
        String sql = "SELECT * FROM blood_bank_users";
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);

        // Display user details
%>
        <h2>User Details</h2>
        <table border="1">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Street Address</th>
                <th>City</th>
                <th>State</th>
                <th>ZIP Code</th>
                <th>Country</th>
                <th>Date of Birth</th>
                <th>Gender</th>
                <th>Blood Group</th>
                <th>Weight</th>
                <th>Username</th>
                <th>Password</th>
                <th>Edit</th>
                <!--<th>Delete</th>-->
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("first_name") %></td>
                <td><%= rs.getString("last_name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone_number") %></td>
                <td><%= rs.getString("street_address") %></td>
                <td><%= rs.getString("city") %></td>
                <td><%= rs.getString("state") %></td>
                <td><%= rs.getString("zip_code") %></td>
                <td><%= rs.getString("country") %></td>
                <td><%= rs.getDate("date_of_birth") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("blood_group") %></td>
                <td><%= rs.getDouble("weight") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("password") %></td>
                <td><a href="edit.jsp?email=<%= rs.getString("email") %>">Edit</a></td>
                <!-- <td><a href="delete.jsp?email=<%= rs.getString("email") %>">Delete</a></td> -->

            </tr>
<%
        }
%>
        </table>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <font color="red"><h1>Error: <%= e.getMessage() %></h1></font>
<%
    } finally {
        // Close resources
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>

</body>
</html>
