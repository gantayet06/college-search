<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
    <!-- You can link your CSS file here if needed -->
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>
<body>

<%
    // JDBC Connection
    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Dhanada@2002");

        // Get the email parameter from the request
        String emailToDelete = request.getParameter("email");

        // Check if the email is provided
        if (emailToDelete != null && !emailToDelete.isEmpty()) {
            // Delete user from the database based on email
            String sql = "DELETE FROM blood_bank_users WHERE email = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, emailToDelete);
            int rowsAffected = pst.executeUpdate();

            // Check if the deletion was successful
            if (rowsAffected > 0) {
%>
                <h2>User Deleted Successfully</h2>
<%
            } else {
%>
                <font color="red"><h1>User not found or could not be deleted</h1></font>
<%
            }
        } else {
%>
            <font color="red"><h1>Invalid request. Email parameter is missing</h1></font>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <font color="red"><h1>Error: <%= e.getMessage() %></h1></font>
<%
    } finally {
        // Close resources
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>

</body>
</html>
