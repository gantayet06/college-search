<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="user_nav_style.css" />
    <style>
      /* Add some basic styling */
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        margin-left: 15%;
      }
      .container {
        width: 80%;
        margin: 0 auto;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <%@ include file="user_nav.jsp" %>
      <h1>
        We appreciate your decision to contribute <br />to our life-saving
        mission.
      </h1>
      <form action=""></form>
      <label for="location"
        >To proceed, please enter the nearest location where you can
        conveniently go to donate blood:</label
      >
      <input type="text" id="location" name="location" />
      <button type="submit">Submit</button>
      <p>
        Your donated blood will be sent to nearest blood bank, ensuring a swift
        and efficient process
      </p>
      <div class=""></div>
    </div>
  </body>
</html>
