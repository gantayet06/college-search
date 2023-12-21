<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Shreeya", "shreeya06");

        // Get form data from the request
        String userEmail = request.getParameter("email");
        String updatedFirstName = request.getParameter("first_name");
        String updatedLastName = request.getParameter("last_name");
        String updatedPhoneNumber = request.getParameter("phone_number");
        String updatedStreetAddress = request.getParameter("street_address");
        String updatedCity = request.getParameter("city");
        String updatedState = request.getParameter("state");
        String updatedZipCode = request.getParameter("zip_code");
        String updatedCountry = request.getParameter("country");
        String updatedDateOfBirth = request.getParameter("date_of_birth");
        String updatedGender = request.getParameter("gender");
        String updatedBloodGroup = request.getParameter("blood_group");
        String updatedWeight = request.getParameter("weight");
        String updatedUsername = request.getParameter("username");
        String updatedPassword = request.getParameter("password");

        // Check if the email is provided
        if (userEmail != null && !userEmail.isEmpty()) {
            // Convert the updatedDateOfBirth string to java.sql.Date
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date utilDate = sdf.parse(updatedDateOfBirth);
                java.sql.Date dateOfBirth = new java.sql.Date(utilDate.getTime());

                // Update user details in the database
                String sql = "UPDATE blood_bank_users SET first_name = ?, last_name = ?, phone_number = ?, " +
                        "street_address = ?, city = ?, state = ?, zip_code = ?, country = ?, date_of_birth = ?, " +
                        "gender = ?, blood_group = ?, weight = ?, username = ?, password = ? WHERE email = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, updatedFirstName);
                pst.setString(2, updatedLastName);
                pst.setString(3, updatedPhoneNumber);
                pst.setString(4, updatedStreetAddress);
                pst.setString(5, updatedCity);
                pst.setString(6, updatedState);
                pst.setString(7, updatedZipCode);
                pst.setString(8, updatedCountry);
                pst.setDate(9, dateOfBirth);
                pst.setString(10, updatedGender);
                pst.setString(11, updatedBloodGroup);
                pst.setString(12, updatedWeight);
                pst.setString(13, updatedUsername);
                pst.setString(14, updatedPassword);
                pst.setString(15, userEmail);

                int rowsAffected = pst.executeUpdate();

                // Check if the update was successful
                if (rowsAffected > 0) {
%>
                    <h2>User Updated Successfully</h2>
<%
                } else {
%>
                    <font color="red"><h1>User not found or could not be updated</h1></font>
<%
                }
            } catch (ParseException pe) {
%>
                <font color="red"><h1>Error parsing date: <%= pe.getMessage() %></h1></font>
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
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
