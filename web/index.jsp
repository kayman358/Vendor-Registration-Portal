<%-- 
    Document   : firstpage
    Created on : May 7, 2017, 11:46:19 AM
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

<html>
    <head>
        <%
    response.addHeader("X-FRAME-OPTIONS", "DENY");
%>
        <script>
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
</script>
        <!--  <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>-->
        <script type="text/javascript" src="js/jquery.chained.mini.js"></script>
        <script type="text/javascript" src="js/test.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FBN Vendor Portal</title>

    </head>
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

            <!--    <center>  <h1>Welcome to FBN Vendor Registration Portal</h1></center>-->


            <h3 style="text-align: left; font-family: Frutiger"> Dear Esteemed Partner,</h3>

            <p style="text-align: left; font-family: Frutiger">In line with First Bank’s transformation 
                drive to automate its Middle and Back Office Processes, we have 
                commenced full automation of our ‘Procure to Pay” processes. 
                This includes a fresh pre-qualification exercise of vendors and 
                migration of shortlisted vendors onto our supplier management platform.</p>
            <p style="text-align: left; font-family: Frutiger"> For the purpose of establishing business relationship and conducting 
                business with First Bank, prospective vendors are required to provide 
                their company’s details in the Form. By completing our Registration Request Form, 
                you understand and agree that we, our subsidiaries and affiliates including the 
                subsidiaries and affiliates of FBN Holding Plc may record, transfer, store, and process 
                your Information in any of the countries in which we and our subsidiaries or affiliates 
                maintain offices.</p> 
            <p style="text-align: left; font-family: Frutiger">You authorize us to use your information as may be required by us in 
                evaluating your company in line with our eligibility and qualification criteria for vendor selection.

                You represent and warrant that all the information furnished by 
                you in the Registration Request Form is true and current and you 
                authorize us to make all enquiries as deemed necessary for the 
                pre-qualification exercise.</p>

            <p style="text-align: left; font-family: Frutiger">    We may at our sole discretion invite you for further verification 
                and information as may be deemed necessary for the pre-qualification 
                exercise. You accept that your pre-qualification by us does not imply or 
                impose any binding obligation on us to invite you to perform or supply any 
                goods and/or services. You agree that we do not have any obligation to 
                provide any explanation for not doing so. </p>

            <p style="text-align: left; font-family: Frutiger">We are looking for suppliers that:
            <ul>
                <li style="text-align: left; font-family: Frutiger">   Have the capacity to provide services across our wide network of outlets nationwide</li>
                <li style="text-align: left; font-family: Frutiger">	mirror our corporate philosophy and business principle;</li>
                <li style="text-align: left; font-family: Frutiger">	offer competitive pricing and cost-savings solutions;</li>
                <li style="text-align: left; font-family: Frutiger">	have proven service record;</li>
                <li style="text-align: left; font-family: Frutiger">	have proven quality assurance systems;</li>
                <li style="text-align: left; font-family: Frutiger">	are financially viable;</li>
                <li style="text-align: left; font-family: Frutiger">    offer value added capabilities;</li>
            </ul>
         <p style="text-align: justify; font-family: Frutiger">    Thank you for your interest in doing business with First Bank Nigeria Limited.
             Please note that:<br /><br /></p>
         
            <p style="text-align: justify; font-family: Frutiger">It shall be the sole responsibility of prequalified suppliers doing business 
                with First Bank to maintain and update their corporate profile in the supplier portal.  
                You agree to and hereby indemnify us from all liabilities that may arise as a result of any incomplete, 
                misstated or misrepresented information supplied by you irrespective of cause, whether or not such liability arose 
                under contract, tort or criminal proceedings or regulatory investigation. </p>
            <p style="text-align: justify; font-family: Frutiger">By completing the Form and/or entering your corporate information on this 
                website, you agree that we shall not be liable for any and all losses, damages, liabilities, claims or 
                expenses incurred by you arising from unauthorized access and/or misuse of your corporate information supplied herein, howsoever caused.</p>
            <p style="text-align: justify; font-family: Frutiger"><strong>This form will be available for completion for a period of three (3) weeks ONLY from 9th August 2017 till 30th August 2017.</strong></p> <p style="text-align: left; color: red; font-family: Frutiger"> <strong>We will not consider or process any information submitted or received by us after this period.</strong>  </p>
            <p style="text-align: left; font-family: Frutiger"> All technical and operational queries on this form should be directed to: <a href="mailto:vendorregistrationhelpdesk@firstbanknigeria.com">Supplier Care</a>.</p>
            <p style="text-align: justify; font-family: Frutiger">  Please indicate your acceptance or otherwise by ticking the appropriate box below.</p>


            <label >Accept Licence Terms</label>
            <br />



            <form action="Licence" method="POST" onsubmit="chk()">
                <input  type="radio"  onchange = "displayBtn(this)" name="accept" value="accept"> &emsp; Yes, I accept to this terms and conditions and I want to proceed.
                <br />
                <input  type="radio" onchange = "removeBtn(this)" name="accept" value="reject"> &emsp;  No, I do not accept the terms and conditions.
                <br />
                <br />
                <div id="hide0">
                    <button type="submit" class="btn btn-primary" onclick="chk()">Proceed</button>
                </div>
            </form>


            <br />
            <br />
        </div>

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
            </div>


        </footer>
    </body>
</html>
