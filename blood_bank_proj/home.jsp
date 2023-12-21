<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        /* Add CSS styles for the college cards */
        .college-card {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .college-card h2 {
            margin-bottom: 5px;
        }
        .college-card p {
            margin: 5px 0;
        }
    </style>
</head>
<body>

<h1>Registered Colleges</h1>

<div class="colleges-container">
    <% 
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Shreeya", "shreeya06");
            stmt = con.createStatement();
            String sql = "SELECT * FROM course_table1"; // Change the table name accordingly
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String collegeName = rs.getString("college_name");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phone_number");
                String courseProvided = rs.getString("courses_provided");
                int fees = rs.getInt("fees");
                String rating = rs.getString("rating");
    %>
                <div class="college-card">
                    <h2><%= collegeName %></h2>
                    <p><strong>Address:</strong> <%= address %></p>
                    <p><strong>Email:</strong> <%= email %></p>
                    <p><strong>Phone Number:</strong> <%= phoneNumber %></p>
                    <p><strong>Courses Provided:</strong> <%= courseProvided %></p>
                    <p><strong>Fees:</strong> <%= fees %></p>
                    <p><strong>Rating:</strong> <%= rating %></p>
                </div>
    <%
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</div>

</body>
</html>
