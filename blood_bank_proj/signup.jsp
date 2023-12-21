<%@ page import="java.sql.*,java.util.*" %>
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
    String firstName = request.getParameter("first_name");
    String lastName = request.getParameter("last_name");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phone_number");
    String streetAddress = request.getParameter("street_address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipCode = request.getParameter("zip_code");
    String country = request.getParameter("country");
    String dob = request.getParameter("date_of_birth");
    String gender = request.getParameter("gender");
    String bloodGroup = request.getParameter("blood_group");
    //int weight = Integer.parseInt(request.getParameter("weight"));
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JDBC Connection
    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Shreeya", "shreeya06");

        // Insert data into the table
        String sql = "INSERT INTO test2 " +
                     "(first_name, last_name,) " +
                     "VALUES (?, ?, TO_DATE(?, 'yyyy-MM-dd'), ?, ?,)";

        pst = con.prepareStatement(sql);
        pst.setString(1, firstName);
        pst.setString(2, lastName);
        /*pst.setString(3, email);
        pst.setString(4, phoneNumber);
        pst.setString(5, streetAddress);
        pst.setString(6, city);
        pst.setString(7, state);
        pst.setString(8, zipCode);
        pst.setString(9, country);
        pst.setString(10, dob);
        pst.setString(11, gender);
        pst.setString(12, bloodGroup);
        //pst.setInt(13, weight);
        pst.setString(13, username);
        pst.setString(14, password);

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
    } catch (Exception e) {
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
