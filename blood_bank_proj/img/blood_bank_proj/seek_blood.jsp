<!DOCTYPE html>
<html>
  <head>
    <title>Blood Donation Form</title>
    <link rel="stylesheet" href="user_nav_style.css">
    <link rel="stylesheet" href="form_style.css" />
  </head>
  <body>
    <%@ include file="user_nav.jsp" %>
    <div class="container">
      <h1>Blood Donation Form</h1>
      <p>Thank you for entrusting us to help you find blood donors.</p>
      <p>
        To ensure a quick and effective response, please provide the following
        details:
      </p>
      <form>
        <label for="bloodGroup">Type of Blood Group Needed:</label><br />
        <input type="text" id="bloodGroup" name="bloodGroup" /><br />
        <label for="hospitalName">Nearest Hospital/Clinic Name:</label><br />
        <input type="text" id="hospitalName" name="hospitalName" /><br />
        <label for="hospitalAddress">Hospital/Clinic Address:</label><br />
        <input type="text" id="hospitalAddress" name="hospitalAddress" /><br />
        <label for="hospitalCity">City:</label><br />
        <input type="text" id="hospitalCity" name="hospitalCity" /><br />
        <label for="unitsNeeded">Units Needed:</label><br />
        <input type="number" id="unitsNeeded" name="unitsNeeded" /><br />
        <label for="comments">Comments/Instructions:</label><br />
        <textarea id="comments" name="comments"></textarea><br />
        <input type="submit" value="SUBMIT" />
      </form>
    </div>
  </body>
</html>
