<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="user_nav_style.css" />
    <style>
      body {
        font-family: "Arial", sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f2f2f2;
      }

      /* Container Styles */
      .container {
        max-width: 800px;
        height: 650px;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      .outer-container {
        width: 100%;
        height: 80%;
        margin: 0 auto;
        overflow: hidden;
      }

      /* Style for the inner divs */
      .inner-container1 {
        width: 28%;
        float: left;
        margin: 1%;
        box-sizing: border-box;
        height: 300px; /* Increased height */
        background-color: #e0e0e0;
        padding: 20px;
      }
      .inner-container2 {
        width: 68%;
        float: left;
        margin: 1%;
        box-sizing: border-box;
        height: 300px; /* Increased height */
        background-color: #e0e0e0;
        padding: 20px 40px;
      }

      /* Clearfix to ensure proper layout when using float */
      .clearfix::after {
        content: "";
        display: table;
        clear: both;
      }

      /* Updated style for text-content to take full width */
      .text-content {
        float: left;
        width: 100%;
        box-sizing: border-box;
        padding: 20px;
      }

      /* Additional style for the button */
      button {
        width: 98%;
        padding: 10px;
        color: #fff;
        border: none;
        cursor: pointer;
      }

      /* Updated style for the txt div to take full width */
      .txt {
        clear: both;
        width: 100%;
        box-sizing: border-box;
        padding-top: 20px;
        /*margin-bottom: 30%;
        /*text-align: center;  Align text to the center */
        /*margin-left: 10%;*/
        display: flex;
        justify-content: space-around;
        font-size: 25px;
      }

      /* Updated style for profile-icon and name divs */
      .profile-icon {
        height: 60%;
        background-color: #3498db;
      }

      .name {
        height: 40%;
        background-color: #e74c3c;
      }

      /* Style for the details div */
      .details {
        height: 250px;
        background-color: #3498db;
        margin: 3px;
        overflow-y: scroll;
      }

      /* Style for the update button */
      .update {
        width: 100%;
        background-color: #3498db;
        /*margin-left: 60%;
        margin-top: -20%;*/
      }

      /* Media queries for responsiveness */
      @media only screen and (max-width: 600px) {
        .inner-container {
          width: 100%;
          margin: 0;
        }

        .details-btn,
        .update {
          width: 100%;
        }
      }
    </style>
  </head>
  <body>
    <%@ include file="user_nav.jsp" %>
    <div class="container">
      <div class="text-content">
        <h1>Account Details</h1>
        <p>Review and update your account details</p>
        <p>
          Please make sure these details are up to date, as they will be used
          for managing your blood donation preferences
        </p>
        <p>
          Your information is crucial for facilitating the process of blood
          donation, whether you are seeking or donating blood.
        </p>
      </div>
      <div class="outer-container clearfix">
        <div class="inner-container1">
          <div class="profile-icon"></div>
          <div class="name">
            <p></p>
          </div>
        </div>
        <div class="inner-container2">
          <div class="details">
            <!-- Add your scrollable content here -->
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum
              minima doloribus, vel maxime quidem modi ipsum placeat culpa animi
              blanditiis. Veniam, aliquid! Non dolores ad magni sapiente
              deserunt facere quo molestias explicabo architecto, reiciendis
              suscipit corporis, dolorum fugiat nulla error aut accusamus
              incidunt doloremque expedita repudiandae officia velit ducimus
              neque. Nisi deserunt at reprehenderit amet? Delectus asperiores
              temporibus dolores quam, recusandae architecto in quos aspernatur
              tempore hic impedit, nihil repudiandae. Aliquam quasi nihil beatae
              recusandae eveniet, dolores fuga? Recusandae odio enim est
              inventore voluptatibus dolores illum dignissimos, velit
              reprehenderit minima eveniet maxime dolor exercitationem beatae
              numquam repellendus ipsam iure possimus voluptate atque
            </p>
          </div>
        </div>
        <div class="txt">
          <span>Your data will be handled with care</span>
          <span><button class="update">Update</button></span>
        </div>
      </div>
    </div>
  </body>
</html>
