<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Result</title>
</head>
<body>

<%
    // Retrieve form parameters
    String collegeName = request.getParameter("college_name");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phone_number");
    String courseProvided = request.getParameter("course_provided");
    String fees = request.getParameter("fees");
    String rating = request.getParameter("rating");

    int feesValue = 0; // Default value for fees

    // Check if fees parameter is not null and not empty, then parse it as an integer
    if (fees != null && !fees.isEmpty()) {
        try {
            feesValue = Integer.parseInt(fees);
        } catch (NumberFormatException ex) {
            // Handle the case where fees cannot be parsed as an integer
            ex.printStackTrace(); // Log the exception or perform error handling as needed
        }
    }

    // JDBC Connection
    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Shreeya", "shreeya06");

        // Insert data into the table
        String sql = "INSERT INTO course_table1 " +
                     "(college_name, address, email, phone_number, courses_provided, fees, rating) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        pst = con.prepareStatement(sql);
        pst.setString(1, collegeName);
        pst.setString(2, address);
        pst.setString(3, email);
        pst.setString(4, phoneNumber);
        pst.setString(5, courseProvided);
        pst.setInt(6, feesValue); // Set fees as an integer
        pst.setString(7, rating);

        // Execute the insert statement
        int rowsAffected = pst.executeUpdate();

        if (rowsAffected > 0) {
%>
            <font color="green"><h1>Registration Successful</h1></font>
<%
        } else {
%>
            <font color="red"><h1>Registration Failed</h1></font>
<%
        }
    } catch (SQLException | ClassNotFoundException e) {
%>
        <font color="red"><h1>Error: <%= e.getMessage() %></h1></font>
<%
    } finally {
        // Close resources
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            // Handle closing connection/statement error
            e.printStackTrace();
        }
    }
%>

</body>
</html>
