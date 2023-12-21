<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="user_nav_style.css" />
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #ffffff;
      }
      h1,
      p {
        color: #000000;
      }
      .container {
        width: 80%;
        margin: 0 auto;
      }
      .header {
        text-align: center;
        margin-bottom: 50px;
      }
      .image {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
      }
      .content {
        text-align: center;
        margin-top: 50px;
      }
    </style>
  </head>
  <body>
    <%@ include file="user_nav.jsp" %>
    <div class="container">
      <div class="header">
        <h1>
          Thank you for your commitment to making a positive impact through
          blood donation.
        </h1>
      </div>
      <img class="image" src="./img/thank_u.png" alt="Donation Image" />
      <div class="content">
        <p>
          "Your selfless act of donating blood has made a significant difference
          in someone's life. Thank you for being a lifesaver!"
        </p>
        <p>Your generosity can help save lives in your community</p>
      </div>
    </div>
  </body>
</html>
