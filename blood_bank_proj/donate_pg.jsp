<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="user_nav_style.css" />
    <style>
      /* Container Styles */
      .container {
        width: 80%;
        margin: 20px auto;
        background-color: #f2f2f2;
        padding: 20px;
        box-sizing: border-box;
        margin-left: 15%;
      }

      /* Inner Divs */
      .inner-div {
        border: 2px solid #ccc;
        margin: 10px;
        padding: 10px;
        box-sizing: border-box;
        background-color: #ffffff;
      }
      table {
        width: 40%;
        border-collapse: collapse;
      }
      table,
      th,
      td {
        border: 1px solid black;
        padding: 7px;
        text-align: left;
      }
      th {
        background-color: red;
        color: white;
      }

      /* Media queries for responsiveness */
      @media only screen and (max-width: 600px) {
        .side-by-side-div {
          width: 100%;
        }
      }

      img {
        height: 300px;
      }

      button {
        cursor: pointer;
        background-color: #4caf50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
      }

      button:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  <body>
    <%@ include file="user_nav.jsp" %>
    <div class="container">
      <div class="inner-div">
        <h2>LEARN ABOUT DONATION</h2>
        <div class="img-div">
          <img src="./img/donate_pg1.png" alt="" />
        </div>
        <div class="compatible-blood">
          <h2>Compatible Blood Type Donors</h2>

          <table>
            <tr>
              <th>Blood Type</th>
              <th>Donate Blood To</th>
              <th>Receive Blood From</th>
            </tr>
            <tr>
              <td>A+</td>
              <td>A+ AB+</td>
              <td>A+ A- O+ O-</td>
            </tr>
            <tr>
              <td>O+</td>
              <td>O+ A+ B+ AB+</td>
              <td>O+ O-</td>
            </tr>
            <tr>
              <td>B+</td>
              <td>B+ AB+</td>
              <td>B+ B- O+ O-</td>
            </tr>
            <tr>
              <td>AB+</td>
              <td>AB+</td>
              <td>Everyone</td>
            </tr>
            <tr>
              <td>O-</td>
              <td>Everyone</td>
              <td>O-</td>
            </tr>
          </table>
        </div>
        <div>
          <p>
            It Costs Nothing<span class="txt">Give Blood and stay healthy</span>
          </p>
          <span><a href="college.html">Donate Now</a></span>
        </div>
      </div>
    </div>
  </body>
</html>
