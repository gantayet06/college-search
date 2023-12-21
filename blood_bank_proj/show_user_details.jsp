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
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Shreeya", "shreeya06");

        // Retrieve all user details from the table
        String sql = "SELECT * FROM course_table1";
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);

        // Display user details
%>
        <h2>User Details</h2>
        <table border="1">
            <tr>
                <th>College Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Course</th>
                <th>Fees</th>
                <th>Rating</th>
                <!--<th>Delete</th>-->
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("college_name") %></td>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone_number") %></td>
                <td><%= rs.getString("courses_provided") %></td>
                <td><%= rs.getDouble("fee") %></td>
                <td><%= rs.getString("rating") %></td>
                <!--<td><%= rs.getString("password") %></td>-->
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
