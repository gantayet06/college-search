<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In Result</title>
</head>
<body>

<%
    // Retrieve form parameters
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JDBC Connection
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Dhanada@2002");

        // Check if the provided username and password match admin credentials
        if (username.equals("admin") && password.equals("admin@123")) {
            // Redirect to admin dashboard
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            // Check if the provided username and password exist in the blood_bank_users table
            String sql = "SELECT * FROM blood_bank_users WHERE username = ? AND password = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if (rs.next()) {
                // If user credentials are valid, redirect to user dashboard
                response.sendRedirect("user_dashboard.jsp");
            } else {
%>
                <font color="red"><h1>Invalid Username or Password</h1></font>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <font color="red"><h1>Error: <%= e.getMessage() %></h1></font>
<%
    } finally {
        // Close resources
        if (rs != null) rs.close();
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>

</body>
</html>
