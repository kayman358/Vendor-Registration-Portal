<%-- 
    Document   : error-404
    Created on : May 13, 2017, 9:42:34 PM
    Author     : Kolade
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> 
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
<script src="script.js" type="text/javascript"></script>
<link rel="stylesheet" href="js/css/bootstrap.min.css">
<link rel="stylesheet" href="js/css/bootstrap.css">
<link rel="stylesheet" href="js/css/intlTelInput.css">

<script src="js/js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/js/intlTelInput.js" type="text/javascript"></script>
<script src="js/js/utils.js" type="text/javascript"></script>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Bad Request - FBN Vendor Portal</title>
       <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <%
    response.addHeader("X-FRAME-OPTIONS", "DENY");
%>
     <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="js/firstbank.png">
                    </a>
                </div>
            </div>
        </nav>
        <div class="container">


            <br />
            <br />
            <br />
            <br />
            <h1 class="page-header">Supplier Capture Portal</h1>
            <h2><strong>Your Browser sent a request that this server could not understand.</strong></h2>
            <center><h3><strong>400: Bad Request</strong></h3></center><br />
            
            <center><h4>You might have probably sent the wrong information to the server, please ensure no unsafe/special characters are sent along.</h4></center>
            <center>  <a href="index.jsp">Supplier Portal Home Page</a></center>
        
     </div>
         <br />
  <footer>
            <div class="container">
                <div class="row">

                    <strong style="color: #fff">&copy 2017. First Bank of Nigeria Ltd. All Rights Reserved</strong><br /><br />
                    <ul class="footer-links">
                         <p style="color:white;float:right;font-weight: 100;font-size: 28px;margin-top: 10px;font-style:italic;">
                    <span style="color: #FFD700">-</span>You First<span style="color: #FFD700">-</span>
                </p>
                        <li id="fb"><a href="http://www.firstbanknigeria.com/" target="_blank">Privacy Policy</a></li>
                        <li id="fb"><a href="http://www.firstbanknigeria.com/" target="_blank">Terms of Use</a></li>
                        <li id="fb"><a href="http://www.firstbanknigeria.com/" target="_blank">Cookie Policy</a></li>
                        <li id="fb"><a href="http://www.firstbanknigeria.com/" target="_blank">Accessibility</a></li>
                    </ul>


                    <div >

                        
                    </div>
                </div>
          


        </footer>
        
    </body>
</html>

