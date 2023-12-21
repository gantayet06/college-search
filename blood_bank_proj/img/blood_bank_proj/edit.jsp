<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- You can link your CSS file here if needed -->
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>
<body>

<%
    // JDBC Connection
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Dhanada@2002");

        // Get the email parameter from the request
        String userEmail = request.getParameter("email");

        // Check if the email is provided
        if (userEmail != null && !userEmail.isEmpty()) {
            // Retrieve user details from the database based on the email
            String sql = "SELECT * FROM blood_bank_users WHERE email = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, userEmail);
            rs = pst.executeQuery();

            if (rs.next()) {
                // Display a form to edit user details
%>
                <h2>Edit User Details</h2>
                <form action="update.jsp" method="post">
                    <!-- Personal Information -->
                    <label for="first_name">First Name:</label>
                    <input type="text" id="first_name" name="first_name" value="<%= rs.getString("first_name") %>" required /><br />

                    <label for="last_name">Last Name:</label>
                    <input type="text" id="last_name" name="last_name" value="<%= rs.getString("last_name") %>" required /><br />

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required readonly /><br />

                    <label for="phone_number">Phone Number:</label>
                    <input type="tel" id="phone_number" name="phone_number" value="<%= rs.getString("phone_number") %>" required /><br />

                    <!-- Address Information -->
                    <label for="street_address">Street Address:</label>
                    <input type="text" id="street_address" name="street_address" value="<%= rs.getString("street_address") %>" required /><br />

                    <label for="city">City:</label>
                    <input type="text" id="city" name="city" value="<%= rs.getString("city") %>" required /><br />

                    <label for="state">State:</label>
                    <input type="text" id="state" name="state" value="<%= rs.getString("state") %>" required /><br />

                    <label for="zip_code">ZIP Code:</label>
                    <input type="text" id="zip_code" name="zip_code" value="<%= rs.getString("zip_code") %>" required /><br />

                    <label for="country">Country:</label>
                    <input type="text" id="country" name="country" value="<%= rs.getString("country") %>" required /><br />

                    <!-- Additional Information -->
                    <label for="date_of_birth">Date of Birth:</label>
                    <input type="date" id="date_of_birth" name="date_of_birth" value="<%= rs.getDate("date_of_birth") %>" required /><br />

                    <label for="gender">Gender:</label>
                    <select id="gender" name="gender" required>
                        <option value="Male" <%= rs.getString("gender").equals("Male") ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= rs.getString("gender").equals("Female") ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= rs.getString("gender").equals("Other") ? "selected" : "" %>>Other</option>
                    </select><br />

                    <label for="blood_group">Blood Group:</label>
                    <input type="text" id="blood_group" name="blood_group" value="<%= rs.getString("blood_group") %>" required /><br />

                    <label for="weight">Weight:</label>
                    <input type="number" id="weight" name="weight" value="<%= rs.getDouble("weight") %>" required /><br />

                    <!-- Account Information -->
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="<%= rs.getString("username") %>" required /><br />

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="<%= rs.getString("password") %>" required /><br />

                    <input type="submit" value="Update" />
                </form>
<%
            } else {
%>
                <font color="red"><h1>User not found</h1></font>
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
        if (rs != null) rs.close();
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>

</body>
</html>
