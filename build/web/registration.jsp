<%-- 
    Document   : VendorForm
    Created on : Apr 6, 2017, 8:35:00 PM
    Author     : Kolade
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@include file="dataSource.jsp" %>
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
        
     <!--   <script>
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () {
                null
            };
        </script> -->
        <!--  <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>-->
        <script type="text/javascript" src="js/jquery.chained.mini.js"></script>
        <script type="text/javascript" src="js/test.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FBN Vendor Portal</title>

    </head>
    <body>
        <%            if (session.getAttribute("accept") == null) {
                response.sendRedirect("index.jsp");
            }
                
        %>
<%
    response.addHeader("X-FRAME-OPTIONS", "DENY");
%>

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
            <img src="js/loading.gif" id="gif" style="display: block; margin: 0 auto; width: 100px; visibility: hidden;">
            <form method="post" action="uploadServlet" enctype="multipart/form-data" id="registrationform" name="registrationform" autocomplete="off">
                <fieldset id="zero">
                    <h2 class="title"> Proposal for company registration should be accompanied by scanned copies of the following:</h2>	
                    <br /><br />
                    <p style="text-align: left; font-family: Frutiger"> a. Certificate of Incorporation. </p>
                    <p style="text-align: left; font-family: Frutiger"> b. Memorandum and Articles of Association for Limited Liability Company and Form 3 for Other Business.</p>	
                    <p style="text-align: left; font-family: Frutiger"> c. Passport Photograph and CV of Prime Movers/ Directors of Company Seeking Registration.</p>
                    <p style="text-align: left; font-family: Frutiger"> d. Reference Letter from a Bank.</p>
                    <p style="text-align: left; font-family: Frutiger"> e. Evidence of Tax Payment for the Last 3 Years. </p>
                    <p style="text-align: left; font-family: Frutiger"> f. VAT Registration Letter/ Tax Identification Number.</p>
                    <p style="text-align: left; font-family: Frutiger"> g. Reference/ Evidence of Previous Contracts Executed.</p>

                    <br /><br />
                    <p class="help-block" style="text-align: left; color: red"><strong>NB: All documents should be scanned into a single PDF</strong></p>
                    <button id="next_btn1" class="btn btn-primary" onclick="next_step1('zero', 'first');" type="button">Next</button>
                </fieldset>
                <fieldset id="first">
                    <h2 class="title">Basic Information</h2>
                    <p class="subtitle">Step 1</p>
                    <div class="form-group required">
                        <label class="control-label">Supplier Name (Organisation Name)</label>
                        <input type="text" class="form-control" id="suppliername" name ="suppliername" placeholder="Name of Company" maxlength="50" required="required">
                    </div>
                    <br />

                    <div class="form-group required">
                        <label for="SupplierType">Supplier Type</label>
                        <select class="form-control" id="selectsup" name="selectsup" onchange="return chang()">
                             <option value="" selected="selected">--Choose--</option>
                      <c:forEach var="row" items="${result4.rows}">
                         
                    <option value="${row.id}">${row.supplierType}</option>
                       </c:forEach>    
                    
                        </select>
                    </div>

                    <div id = "visib">
                        <input type="text" class="form-control" id="others1" name ="others1" placeholder="Others (Specify)">
                    </div>


                    <div class="form-group required">
                        <label for="businessClass">Business Type</label>
                        <select class="form-control" id="business" name="business" onchange="chang2()">
                            <option value="" selected="selected">--Choose--</option>
                             <c:forEach var="row" items="${result3.rows}">
                    <option value="${row.id}">${row.businessClass}</option>
                       </c:forEach>      
                        </select>
                      
                    </div>

                    <div id = "visib2">
                        <input type="text" class="form-control" id="others2" name ="others2" placeholder="Others (Specify)">
                    </div>

                    <br />
                    
                        <div class="form-group required">
                        <label for="officeLocation">Select if company is Nigerian Based and/or Multinational</label>
                        <br />
                        <input name="company" class="source2" type="checkbox" value="Nigerian" id="nigerian" onchange = "displayState(this), localtax(this), getChecked2()"> Nigerian
                        <input name="company" class="source2" type="checkbox" value="Multinational" id="multinational" onchange="multitax(this), getChecked2()"> Multinational
                    </div>
                    <input type="text" class="form-control" id="checkedcompany" name = "checkedcompany">
                    
                    <br />
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="Certifications">Certifications/Regulatory Licensing</label>
                                <input type="text" class="form-control" name = "certifications" id = "certifications" maxlength="50" placeholder="(e.g. ISO 9000,  BS 25999-2:2007)">
                            </div>
                        </div>

                    
                        <div id="tinhide1">
                        <div class="col-md-4">
                            
                            <div class="form-group required">
                                <label for="Tax">Tax Registration Number (TIN)</label>
                                <input type="text" class="form-control" id="tax" name="tax" maxlength="50" placeholder="Tax Registration Number (e.g xxxxxxxx-0001)">
                            </div>
                          
                        </div>
                        </div>
                       
                        <div id="tinhide2">
                        <div class="col-md-4">
                            
                            <div class="form-group required">
                                <label for="Tax">Tax Registration Number (International)</label>
                                <input type="text" class="form-control" id="tax2" name="tax2" maxlength="50" placeholder="Tax Registration Number">
                            </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    
                    <div id="error1">
                      <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                        <strong>Danger! </strong>Please kindly remove special characters that are being sent or fill empty spaces left to be filled.
                      </div>
                    </div>
                    
                    <button id="pre_btn1" class="btn btn-primary" onclick="prev_step1('zero', 'first')" type="button">Previous</button>&emsp;
                    <button id="next_btn1" class="btn btn-primary" onclick="formValidate1()" type="button">Next</button>
                </fieldset>


                <fieldset id="second">
                    <h2 class="title">Supplier Contact Information</h2>
                    <p class="subtitle">Step 2</p>

                    

                    <div id="hide2">

                        <label for="officeLocation">Office Location (select all locations where your Organization exists)</label>
                        <br />
                        <br />
                        <input name="source" class="source" type="checkbox" value="1" onchange="getChecked()"> Abia
                        <input name="source" class="source" type="checkbox" value="2" onchange="getChecked()"> Adamawa
                        <input name="source" class="source" type="checkbox" value="3" onchange="getChecked()"> Akwa-Ibom
                        <input name="source" class="source" type="checkbox" value="4" onchange="getChecked()"> Anambra
                        <input name="source" class="source" type="checkbox" value="5" onchange="getChecked()"> Bauchi
                        <input name="source" class="source" type="checkbox" value="6" onchange="getChecked()"> Bayelsa
                        <input name="source" class="source" type="checkbox" value="7" onchange="getChecked()"> Benue
                        <input name="source" class="source" type="checkbox" value="8" onchange="getChecked()"> Borno
                        <input name="source" class="source" type="checkbox" value="9" onchange="getChecked()"> Cross-River
                        <input name="source" class="source" type="checkbox" value="10" onchange="getChecked()"> Delta
                        <input name="source" class="source" type="checkbox" value="11" onchange="getChecked()"> Ebonyi<br /><br />
                        <input name="source" class="source" type="checkbox" value="12" onchange="getChecked()"> Edo
                        <input name="source" class="source" type="checkbox" value="13" onchange="getChecked()"> Ekiti
                        <input name="source" class="source" type="checkbox" value="14" onchange="getChecked()"> Enugu
                        <input name="source" class="source" type="checkbox" value="15" onchange="getChecked()"> FCT
                        <input name="source" class="source" type="checkbox" value="16" onchange="getChecked()"> Gombe
                        <input name="source" class="source" type="checkbox" value="17" onchange="getChecked()"> Imo
                        <input name="source" class="source" type="checkbox" value="18" onchange="getChecked()"> Jigawa
                        <input name="source" class="source" type="checkbox" value="19" onchange="getChecked()"> Kaduna
                        <input name="source" class="source" type="checkbox" value="20" onchange="getChecked()"> Kano
                        <input name="source" class="source" type="checkbox" value="21" onchange="getChecked()"> Katsina
                        <input name="source" class="source" type="checkbox" value="22" onchange="getChecked()"> Kebbi
                        <input name="source" class="source" type="checkbox" value="23" onchange="getChecked()"> Kogi
                        <input name="source" class="source" type="checkbox" value="24" onchange="getChecked()"> Kwara
                        <input name="source" class="source" type="checkbox" value="25" onchange="getChecked()"> Lagos<br /><br />
                        <input name="source" class="source" type="checkbox" value="26" onchange="getChecked()"> Nasarrawa
                        <input name="source" class="source" type="checkbox" value="27" onchange="getChecked()"> Niger
                        <input name="source" class="source" type="checkbox" value="28" onchange="getChecked()"> Ogun
                        <input name="source" class="source" type="checkbox" value="29" onchange="getChecked()"> Ondo
                        <input name="source" class="source" type="checkbox" value="30" onchange="getChecked()"> Osun
                        <input name="source" class="source" type="checkbox" value="31" onchange="getChecked()"> Oyo
                        <input name="source" class="source" type="checkbox" value="32" onchange="getChecked()"> Plateau
                        <input name="source" class="source" type="checkbox" value="33" onchange="getChecked()"> Rivers
                        <input name="source" class="source" type="checkbox" value="34" onchange="getChecked()"> Sokoto
                        <input name="source" class="source" type="checkbox" value="35" onchange="getChecked()"> Taraba
                        <input name="source" class="source" type="checkbox" value="36" onchange="getChecked()"> Yobe
                        <input name="source" class="source" type="checkbox" value="37" onchange="getChecked()"> Zamfara<br /><br />

                    </div>
                    <!--   <button onclick="getChecked()" type="button">check</button>-->
                    <input type="text" class="form-control" id="checkedstate" name = "checkedstate">

                    <strong><h4> Primary Location Details</h4></strong>
                    <div class="form-group required">
                        <label for="sitename">Location Name (Primary Location)</label>
                        <input type="text" class="form-control" id="site" name = "site" maxlength="50" placeholder="Location Name (Primary Location)" required="true">
                    </div>

                    <br />
                    <div class="form-group required">
                        <label for="country">Country</label>
                        <select class="form-control" id="country" name="country"  onchange="return mycountry()">

                            <option value="Nigeria">Nigeria</option>
                            <option value="Afghanistan">Afghanistan</option>
                            <option value="ALand Islands">ALand Islands</option>
                            <option value="Albania">Albania</option>
                            <option value="Algeria">Algeria</option>
                            <option value="American Samoa">American Samoa</option>
                            <option value="Andorra">Andorra</option>
                            <option value="Angola">Angola</option>
                            <option value="Anguilla">Anguilla</option>
                            <option value="Antarctica">Antarctica</option>
                            <option value="Antigua And Barbuda">Antigua And Barbuda</option>
                            <option value="Argentina">Argentina</option>
                            <option value="Armenia">Armenia</option>
                            <option value="Aruba">Aruba</option>
                            <option value="Australia">Australia</option>
                            <option value="Austria">Austria</option>
                            <option value="Azerbaijan">Azerbaijan</option>
                            <option value="Bahamas">Bahamas</option>
                            <option value="Bahrain">Bahrain</option>
                            <option value="Bangladesh">Bangladesh</option>
                            <option value="Barbados">Barbados</option>
                            <option value="Belarus">Belarus</option>
                            <option value="Belgium">Belgium</option>
                            <option value="Belize">Belize</option>
                            <option value="Benin">Benin</option>
                            <option value="Bermuda">Bermuda</option>
                            <option value="Bhutan">Bhutan</option>
                            <option value="Bolivia">Bolivia</option>
                            <option value="Bosnia And Herzegovina">Bosnia And Herzegovina</option>
                            <option value="Botswana">Botswana</option>
                            <option value="Bouvet Island">Bouvet Island</option>
                            <option value="Brazil">Brazil</option>
                            <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                            <option value="Brunei Darussalam">Brunei Darussalam</option>
                            <option value="Bulgaria">Bulgaria</option>
                            <option value="Burkina Faso">Burkina Faso</option>
                            <option value="Burundi">Burundi</option>
                            <option value="Cambodia">Cambodia</option>
                            <option value="Cameroon">Cameroon</option>
                            <option value="Canada">Canada</option>
                            <option value="Cape Verde">Cape Verde</option>
                            <option value="Cayman Islands">Cayman Islands</option>
                            <option value="Central African Republic">Central African Republic</option>
                            <option value="Chad">Chad</option>
                            <option value="Chile">Chile</option>
                            <option value="China">China</option>
                            <option value="Christmas Island">Christmas Island</option>
                            <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                            <option value="Colombia">Colombia</option>
                            <option value="Comoros">Comoros</option>
                            <option value="Congo">Congo</option>
                            <option value="Congo, The Democratic Republic Of The">Congo, The Democratic Republic Of The</option>
                            <option value="Cook Islands">Cook Islands</option>
                            <option value="Costa Rica">Costa Rica</option>
                            <option value="Cote D'Ivoire">Cote D'Ivoire</option>
                            <option value="Croatia">Croatia</option>
                            <option value="Cuba">Cuba</option>
                            <option value="Cyprus">Cyprus</option>
                            <option value="Czech Republic">Czech Republic</option>
                            <option value="Denmark">Denmark</option>
                            <option value="Djibouti">Djibouti</option>
                            <option value="Dominica">Dominica</option>
                            <option value="Dominican Republic">Dominican Republic</option>
                            <option value="Ecuador">Ecuador</option>
                            <option value="Egypt">Egypt</option>
                            <option value="El Salvador">El Salvador</option>
                            <option value="Equatorial Guinea">Equatorial Guinea</option>
                            <option value="Eritrea">Eritrea</option>
                            <option value="Estonia">Estonia</option>
                            <option value="Ethiopia">Ethiopia</option>
                            <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                            <option value="Faroe Islands">Faroe Islands</option>
                            <option value="Fiji">Fiji</option>
                            <option value="Finland">Finland</option>
                            <option value="France">France</option>
                            <option value="French Guiana">French Guiana</option>
                            <option value="French Polynesia">French Polynesia</option>
                            <option value="French Southern Territories">French Southern Territories</option>
                            <option value="Gabon">Gabon</option>
                            <option value="Gambia">Gambia</option>
                            <option value="Georgia">Georgia</option>
                            <option value="Germany">Germany</option>
                            <option value="Ghana">Ghana</option>
                            <option value="Gibraltar">Gibraltar</option>
                            <option value="Greece">Greece</option>
                            <option value="Greenland">Greenland</option>
                            <option value="Grenada">Grenada</option>
                            <option value="Guadeloupe">Guadeloupe</option>
                            <option value="Guam">Guam</option>
                            <option value="Guatemala">Guatemala</option>
                            <option value="Guernsey">Guernsey</option>
                            <option value="Guinea">Guinea</option>
                            <option value="Guinea-Bissau">Guinea-Bissau</option>
                            <option value="Guyana">Guyana</option>
                            <option value="Haiti">Haiti</option>
                            <option value="Heard Island And Mcdonald Islands">Heard Island And Mcdonald Islands</option>
                            <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                            <option value="Honduras">Honduras</option>
                            <option value="Hong Kong">Hong Kong</option>
                            <option value="Hungary">Hungary</option>
                            <option value="Iceland">Iceland</option>
                            <option value="India">India</option>
                            <option value="Indonesia">Indonesia</option>
                            <option value="Iran, Islamic Republic Of">Iran, Islamic Republic Of</option>
                            <option value="Iraq">Iraq</option>
                            <option value="Ireland">Ireland</option>
                            <option value="Isle Of Man">Isle Of Man</option>
                            <option value="Israel">Israel</option>
                            <option value="Italy">Italy</option>
                            <option value="Jamaica">Jamaica</option>
                            <option value="Japan">Japan</option>
                            <option value="Jersey ">Jersey</option>
                            <option value="Jordan">Jordan</option>
                            <option value="Kazakhstan">Kazakhstan</option>
                            <option value="Kenya">Kenya</option>
                            <option value="Kiribati">Kiribati</option>
                            <option value="Korea, Democratic People'S Republic Of">Korea, Democratic People'S Republic Of</option>
                            <option value="Korea, Republic Of">Korea, Republic Of</option>
                            <option value="Kuwait">Kuwait</option>
                            <option value="Kyrgyzstan">Kyrgyzstan</option>
                            <option value="Lao People'S Democratic Republic">Lao People'S Democratic Republic</option>
                            <option value="Latvia">Latvia</option>
                            <option value="Lebanon">Lebanon</option>
                            <option value="Lesotho">Lesotho</option>
                            <option value="Liberia">Liberia</option>
                            <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                            <option value="Liechtenstein">Liechtenstein</option>
                            <option value="Lithuania">Lithuania</option>
                            <option value="Luxembourg">Luxembourg</option>
                            <option value="Macao">Macao</option>
                            <option value="Macedonia, The Former Yugoslav Republic Of">Macedonia, The Former Yugoslav Republic Of</option>
                            <option value="Madagascar">Madagascar</option>
                            <option value="Malawi">Malawi</option>
                            <option value="Malaysia">Malaysia</option>
                            <option value="Maldives">Maldives</option>
                            <option value="Mali">Mali</option>
                            <option value="Malta">Malta</option>
                            <option value="Marshall Islands">Marshall Islands</option>
                            <option value="Martinique">Martinique</option>
                            <option value="Mauritania">Mauritania</option>
                            <option value="Mauritius">Mauritius</option>
                            <option value="Mayotte">Mayotte</option>
                            <option value="Mexico">Mexico</option>
                            <option value="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
                            <option value="Moldova, Republic Of">Moldova, Republic Of</option>
                            <option value="Monaco">Monaco</option>
                            <option value="Mongolia">Mongolia</option>
                            <option value="Montserrat">Montserrat</option>
                            <option value="Morocco">Morocco</option>
                            <option value="Mozambique">Mozambique</option>
                            <option value="Myanmar">Myanmar</option>
                            <option value="Namibia">Namibia</option>
                            <option value="Nauru">Nauru</option>
                            <option value="Nepal">Nepal</option>
                            <option value="Netherlands">Netherlands</option>
                            <option value="Netherlands Antilles">Netherlands Antilles</option>
                            <option value="New Caledonia">New Caledonia</option>
                            <option value="New Zealand">New Zealand</option>
                            <option value="Nicaragua">Nicaragua</option>
                            <option value="Niger">Niger</option>
                            <option value="Niue">Niue</option>
                            <option value="Norfolk Island">Norfolk Island</option>
                            <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                            <option value="Norway">Norway</option>
                            <option value="Oman">Oman</option>
                            <option value="Pakistan">Pakistan</option>
                            <option value="Palau">Palau</option>
                            <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                            <option value="Panama">Panama</option>
                            <option value="Papua New Guinea">Papua New Guinea</option>
                            <option value="Paraguay">Paraguay</option>
                            <option value="Peru">Peru</option>
                            <option value="Philippines">Philippines</option>
                            <option value="Pitcairn">Pitcairn</option>
                            <option value="Poland">Poland</option>
                            <option value="Portugal">Portugal</option>
                            <option value="Puerto Rico">Puerto Rico</option>
                            <option value="Qatar">Qatar</option>
                            <option value="Reunion">Reunion</option>
                            <option value="Romania">Romania</option>
                            <option value="Russian Federation">Russian Federation</option>
                            <option value="Rwanda">Rwanda</option>
                            <option value="Saint Helena">Saint Helena</option>
                            <option value="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
                            <option value="Saint Lucia">Saint Lucia</option>
                            <option value="Saint Pierre And Miquelon">Saint Pierre And Miquelon</option>
                            <option value="Saint Vincent And The Grenadines">Saint Vincent And The Grenadines</option>
                            <option value="Samoa">Samoa</option>
                            <option value="San Marino">San Marino</option>
                            <option value="Sao Tome And Principe">Sao Tome And Principe</option>
                            <option value="Saudi Arabia">Saudi Arabia</option>
                            <option value="Senegal">Senegal</option>
                            <option value="Serbia And Montenegro">Serbia And Montenegro</option>
                            <option value="Seychelles">Seychelles</option>
                            <option value="Sierra Leone">Sierra Leone</option>
                            <option value="Singapore">Singapore</option>
                            <option value="Slovakia">Slovakia</option>
                            <option value="Slovenia">Slovenia</option>
                            <option value="Solomon Islands">Solomon Islands</option>
                            <option value="Somalia">Somalia</option>
                            <option value="South Africa">South Africa</option>
                            <option value="South Georgia And The South Sandwich Islands">South Georgia And The South Sandwich Islands</option>
                            <option value="Spain">Spain</option>
                            <option value="Sri Lanka">Sri Lanka</option>
                            <option value="Sudan">Sudan</option>
                            <option value="Suriname">Suriname</option>
                            <option value="Svalbard And Jan Mayen">Svalbard And Jan Mayen</option>
                            <option value="Swaziland">Swaziland</option>
                            <option value="Sweden">Sweden</option>
                            <option value="Switzerland">Switzerland</option>
                            <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                            <option value="Taiwan, Province Of China">Taiwan, Province Of China</option>
                            <option value="Tajikistan">Tajikistan</option>
                            <option value="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
                            <option value="Thailand">Thailand</option>
                            <option value="Timor-Leste">Timor-Leste</option>
                            <option value="Togo">Togo</option>
                            <option value="Tokelau">Tokelau</option>
                            <option value="Tonga">Tonga</option>
                            <option value="Trinidad And Tobago">Trinidad And Tobago</option>
                            <option value="Tunisia">Tunisia</option>
                            <option value="Turkey">Turkey</option>
                            <option value="Turkmenistan">Turkmenistan</option>
                            <option value="Turks And Caicos Islands">Turks And Caicos Islands</option>
                            <option value="Tuvalu">Tuvalu</option>
                            <option value="Uganda">Uganda</option>
                            <option value="Ukraine">Ukraine</option>
                            <option value="United Arab Emirates">United Arab Emirates</option>
                            <option value="United Kingdom">United Kingdom</option>
                            <option value="United States">United States</option>
                            <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                            <option value="Uruguay">Uruguay</option>
                            <option value="Uzbekistan">Uzbekistan</option>
                            <option value="Vanuatu">Vanuatu</option>
                            <option value="Venezuela">Venezuela</option>
                            <option value="Viet Nam">Viet Nam</option>
                            <option value="Virgin Islands, British">Virgin Islands, British</option>
                            <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                            <option value="Wallis And Futuna">Wallis And Futuna</option>
                            <option value="Western Sahara">Western Sahara</option>
                            <option value="Yemen">Yemen</option>
                            <option value="Zambia">Zambia</option>
                            <option value="Zimbabwe">Zimbabwe</option>
                        </select>
                    </div>
                    <br />

                    <div class="form-group required">
                        <label for="addressline1">Address line 1</label>
                        <input type="text" class="form-control" id="addressline1" name="addressline1" maxlength="80" placeholder="Address line 1" required="true">
                    </div>

                    <br />


                    <div class="form-group">
                        <label for="addressline2">Address line 2</label>
                        <input type="text" class="form-control" id="addressline2" name="addressline2" maxlength="80" placeholder="Address line 2">
                    </div>

                    <br />

                    <div class="form-group">
                        <label for="addressline3">Address line 3</label>
                        <input type="text" class="form-control" id="addressline3" name="addressline3" maxlength="80" placeholder="Address line 3">
                    </div>

                    <div class="form-group">
                        <label for="postalcode">Postal Code</label>
                        <input type="text" class="form-control" id="postal" name="postal" placeholder="Postal code" disabled>
                    </div>

                    <br />

                    <div class="form-group required">
                        <label for="city">City Name</label> 
                        <input type="text" id="city" class="form-control" name ="city" maxlength="50" placeholder="City Name" required="true">
                    </div>

                    <br />

                    <div id="countryy">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-4 required">
                                    <label for="state">State</label> 
                                    <select name="customerResidState" class="form-control" id="customerResidState">
                                        <option selected="selected" value="">Select State</option>
                                        <jsp:include page="/WEB-INF/jspf/nigerianstates.jspf"/>
                                    </select>
                                </div>


                                <div class="col-md-4 required"><label for="County">LGA</label>
                                    <select name="customerResidCity" class="form-control" id="customerResidCity">
                                        <option selected="selected" value="" class="">Choose State before LGA</option>
                                        <jsp:include page="/WEB-INF/jspf/nigerianlgas.jspf"/>
                                    </select>

                                </div>


                                <div class="col-md-4 required"><label for="operatingunit">Operating Unit</label>
                                    <select class="form-control" id="unit" name="unit">
                                        <option value="Nigeria">Nigeria</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <button type="button" id="add_site" class="btn btn-primary btn-sm" onClick="addSiteName()" >Add Secondary Location</button>
                    <div id="hide">
                        <strong><h4> Secondary Location Details (Optional)</h4></strong>
                        <div class="form-group">
                            <label for="sitename">Location Name (Secondary Location)</label>
                            <input type="text" class="form-control" id="site2" name = "site2" maxlength="50" placeholder="Location Name (Primary location)">
                        </div>

                        <br />
                        <div class="form-group">
                            <label for="country">Country</label>
                            <select class="form-control" id="country2" name="country2">
                                <option value="" selected="selected">Select</option>
                                <option value="Nigeria">Nigeria</option>
                                <option value="Afghanistan">Afghanistan</option>
                                <option value="ALand Islands">ALand Islands</option>
                                <option value="Albania">Albania</option>
                                <option value="Algeria">Algeria</option>
                                <option value="American Samoa">American Samoa</option>
                                <option value="Andorra">Andorra</option>
                                <option value="Angola">Angola</option>
                                <option value="Anguilla">Anguilla</option>
                                <option value="Antarctica">Antarctica</option>
                                <option value="Antigua And Barbuda">Antigua And Barbuda</option>
                                <option value="Argentina">Argentina</option>
                                <option value="Armenia">Armenia</option>
                                <option value="Aruba">Aruba</option>
                                <option value="Australia">Australia</option>
                                <option value="Austria">Austria</option>
                                <option value="Azerbaijan">Azerbaijan</option>
                                <option value="Bahamas">Bahamas</option>
                                <option value="Bahrain">Bahrain</option>
                                <option value="Bangladesh">Bangladesh</option>
                                <option value="Barbados">Barbados</option>
                                <option value="Belarus">Belarus</option>
                                <option value="Belgium">Belgium</option>
                                <option value="Belize">Belize</option>
                                <option value="Benin">Benin</option>
                                <option value="Bermuda">Bermuda</option>
                                <option value="Bhutan">Bhutan</option>
                                <option value="Bolivia">Bolivia</option>
                                <option value="Bosnia And Herzegovina">Bosnia And Herzegovina</option>
                                <option value="Botswana">Botswana</option>
                                <option value="Bouvet Island">Bouvet Island</option>
                                <option value="Brazil">Brazil</option>
                                <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                <option value="Brunei Darussalam">Brunei Darussalam</option>
                                <option value="Bulgaria">Bulgaria</option>
                                <option value="Burkina Faso">Burkina Faso</option>
                                <option value="Burundi">Burundi</option>
                                <option value="Cambodia">Cambodia</option>
                                <option value="Cameroon">Cameroon</option>
                                <option value="Canada">Canada</option>
                                <option value="Cape Verde">Cape Verde</option>
                                <option value="Cayman Islands">Cayman Islands</option>
                                <option value="Central African Republic">Central African Republic</option>
                                <option value="Chad">Chad</option>
                                <option value="Chile">Chile</option>
                                <option value="China">China</option>
                                <option value="Christmas Island">Christmas Island</option>
                                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                <option value="Colombia">Colombia</option>
                                <option value="Comoros">Comoros</option>
                                <option value="Congo">Congo</option>
                                <option value="Congo, The Democratic Republic Of The">Congo, The Democratic Republic Of The</option>
                                <option value="Cook Islands">Cook Islands</option>
                                <option value="Costa Rica">Costa Rica</option>
                                <option value="Cote D'Ivoire">Cote D'Ivoire</option>
                                <option value="Croatia">Croatia</option>
                                <option value="Cuba">Cuba</option>
                                <option value="Cyprus">Cyprus</option>
                                <option value="Czech Republic">Czech Republic</option>
                                <option value="Denmark">Denmark</option>
                                <option value="Djibouti">Djibouti</option>
                                <option value="Dominica">Dominica</option>
                                <option value="Dominican Republic">Dominican Republic</option>
                                <option value="Ecuador">Ecuador</option>
                                <option value="Egypt">Egypt</option>
                                <option value="El Salvador">El Salvador</option>
                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                <option value="Eritrea">Eritrea</option>
                                <option value="Estonia">Estonia</option>
                                <option value="Ethiopia">Ethiopia</option>
                                <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                <option value="Faroe Islands">Faroe Islands</option>
                                <option value="Fiji">Fiji</option>
                                <option value="Finland">Finland</option>
                                <option value="France">France</option>
                                <option value="French Guiana">French Guiana</option>
                                <option value="French Polynesia">French Polynesia</option>
                                <option value="French Southern Territories">French Southern Territories</option>
                                <option value="Gabon">Gabon</option>
                                <option value="Gambia">Gambia</option>
                                <option value="Georgia">Georgia</option>
                                <option value="Germany">Germany</option>
                                <option value="Ghana">Ghana</option>
                                <option value="Gibraltar">Gibraltar</option>
                                <option value="Greece">Greece</option>
                                <option value="Greenland">Greenland</option>
                                <option value="Grenada">Grenada</option>
                                <option value="Guadeloupe">Guadeloupe</option>
                                <option value="Guam">Guam</option>
                                <option value="Guatemala">Guatemala</option>
                                <option value="Guernsey">Guernsey</option>
                                <option value="Guinea">Guinea</option>
                                <option value="Guinea-Bissau">Guinea-Bissau</option>
                                <option value="Guyana">Guyana</option>
                                <option value="Haiti">Haiti</option>
                                <option value="Heard Island And Mcdonald Islands">Heard Island And Mcdonald Islands</option>
                                <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                <option value="Honduras">Honduras</option>
                                <option value="Hong Kong">Hong Kong</option>
                                <option value="Hungary">Hungary</option>
                                <option value="Iceland">Iceland</option>
                                <option value="India">India</option>
                                <option value="Indonesia">Indonesia</option>
                                <option value="Iran, Islamic Republic Of">Iran, Islamic Republic Of</option>
                                <option value="Iraq">Iraq</option>
                                <option value="Ireland">Ireland</option>
                                <option value="Isle Of Man">Isle Of Man</option>
                                <option value="Israel">Israel</option>
                                <option value="Italy">Italy</option>
                                <option value="Jamaica">Jamaica</option>
                                <option value="Japan">Japan</option>
                                <option value="Jersey ">Jersey</option>
                                <option value="Jordan">Jordan</option>
                                <option value="Kazakhstan">Kazakhstan</option>
                                <option value="Kenya">Kenya</option>
                                <option value="Kiribati">Kiribati</option>
                                <option value="Korea, Democratic People'S Republic Of">Korea, Democratic People'S Republic Of</option>
                                <option value="Korea, Republic Of">Korea, Republic Of</option>
                                <option value="Kuwait">Kuwait</option>
                                <option value="Kyrgyzstan">Kyrgyzstan</option>
                                <option value="Lao People'S Democratic Republic">Lao People'S Democratic Republic</option>
                                <option value="Latvia">Latvia</option>
                                <option value="Lebanon">Lebanon</option>
                                <option value="Lesotho">Lesotho</option>
                                <option value="Liberia">Liberia</option>
                                <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                <option value="Liechtenstein">Liechtenstein</option>
                                <option value="Lithuania">Lithuania</option>
                                <option value="Luxembourg">Luxembourg</option>
                                <option value="Macao">Macao</option>
                                <option value="Macedonia, The Former Yugoslav Republic Of">Macedonia, The Former Yugoslav Republic Of</option>
                                <option value="Madagascar">Madagascar</option>
                                <option value="Malawi">Malawi</option>
                                <option value="Malaysia">Malaysia</option>
                                <option value="Maldives">Maldives</option>
                                <option value="Mali">Mali</option>
                                <option value="Malta">Malta</option>
                                <option value="Marshall Islands">Marshall Islands</option>
                                <option value="Martinique">Martinique</option>
                                <option value="Mauritania">Mauritania</option>
                                <option value="Mauritius">Mauritius</option>
                                <option value="Mayotte">Mayotte</option>
                                <option value="Mexico">Mexico</option>
                                <option value="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
                                <option value="Moldova, Republic Of">Moldova, Republic Of</option>
                                <option value="Monaco">Monaco</option>
                                <option value="Mongolia">Mongolia</option>
                                <option value="Montserrat">Montserrat</option>
                                <option value="Morocco">Morocco</option>
                                <option value="Mozambique">Mozambique</option>
                                <option value="Myanmar">Myanmar</option>
                                <option value="Namibia">Namibia</option>
                                <option value="Nauru">Nauru</option>
                                <option value="Nepal">Nepal</option>
                                <option value="Netherlands">Netherlands</option>
                                <option value="Netherlands Antilles">Netherlands Antilles</option>
                                <option value="New Caledonia">New Caledonia</option>
                                <option value="New Zealand">New Zealand</option>
                                <option value="Nicaragua">Nicaragua</option>
                                <option value="Niger">Niger</option>
                                <option value="Niue">Niue</option>
                                <option value="Norfolk Island">Norfolk Island</option>
                                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                <option value="Norway">Norway</option>
                                <option value="Oman">Oman</option>
                                <option value="Pakistan">Pakistan</option>
                                <option value="Palau">Palau</option>
                                <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                <option value="Panama">Panama</option>
                                <option value="Papua New Guinea">Papua New Guinea</option>
                                <option value="Paraguay">Paraguay</option>
                                <option value="Peru">Peru</option>
                                <option value="Philippines">Philippines</option>
                                <option value="Pitcairn">Pitcairn</option>
                                <option value="Poland">Poland</option>
                                <option value="Portugal">Portugal</option>
                                <option value="Puerto Rico">Puerto Rico</option>
                                <option value="Qatar">Qatar</option>
                                <option value="Reunion">Reunion</option>
                                <option value="Romania">Romania</option>
                                <option value="Russian Federation">Russian Federation</option>
                                <option value="Rwanda">Rwanda</option>
                                <option value="Saint Helena">Saint Helena</option>
                                <option value="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
                                <option value="Saint Lucia">Saint Lucia</option>
                                <option value="Saint Pierre And Miquelon">Saint Pierre And Miquelon</option>
                                <option value="Saint Vincent And The Grenadines">Saint Vincent And The Grenadines</option>
                                <option value="Samoa">Samoa</option>
                                <option value="San Marino">San Marino</option>
                                <option value="Sao Tome And Principe">Sao Tome And Principe</option>
                                <option value="Saudi Arabia">Saudi Arabia</option>
                                <option value="Senegal">Senegal</option>
                                <option value="Serbia And Montenegro">Serbia And Montenegro</option>
                                <option value="Seychelles">Seychelles</option>
                                <option value="Sierra Leone">Sierra Leone</option>
                                <option value="Singapore">Singapore</option>
                                <option value="Slovakia">Slovakia</option>
                                <option value="Slovenia">Slovenia</option>
                                <option value="Solomon Islands">Solomon Islands</option>
                                <option value="Somalia">Somalia</option>
                                <option value="South Africa">South Africa</option>
                                <option value="South Georgia And The South Sandwich Islands">South Georgia And The South Sandwich Islands</option>
                                <option value="Spain">Spain</option>
                                <option value="Sri Lanka">Sri Lanka</option>
                                <option value="Sudan">Sudan</option>
                                <option value="Suriname">Suriname</option>
                                <option value="Svalbard And Jan Mayen">Svalbard And Jan Mayen</option>
                                <option value="Swaziland">Swaziland</option>
                                <option value="Sweden">Sweden</option>
                                <option value="Switzerland">Switzerland</option>
                                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                <option value="Taiwan, Province Of China">Taiwan, Province Of China</option>
                                <option value="Tajikistan">Tajikistan</option>
                                <option value="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
                                <option value="Thailand">Thailand</option>
                                <option value="Timor-Leste">Timor-Leste</option>
                                <option value="Togo">Togo</option>
                                <option value="Tokelau">Tokelau</option>
                                <option value="Tonga">Tonga</option>
                                <option value="Trinidad And Tobago">Trinidad And Tobago</option>
                                <option value="Tunisia">Tunisia</option>
                                <option value="Turkey">Turkey</option>
                                <option value="Turkmenistan">Turkmenistan</option>
                                <option value="Turks And Caicos Islands">Turks And Caicos Islands</option>
                                <option value="Tuvalu">Tuvalu</option>
                                <option value="Uganda">Uganda</option>
                                <option value="Ukraine">Ukraine</option>
                                <option value="United Arab Emirates">United Arab Emirates</option>
                                <option value="United Kingdom">United Kingdom</option>
                                <option value="United States">United States</option>
                                <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                <option value="Uruguay">Uruguay</option>
                                <option value="Uzbekistan">Uzbekistan</option>
                                <option value="Vanuatu">Vanuatu</option>
                                <option value="Venezuela">Venezuela</option>
                                <option value="Viet Nam">Viet Nam</option>
                                <option value="Virgin Islands, British">Virgin Islands, British</option>
                                <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                <option value="Wallis And Futuna">Wallis And Futuna</option>
                                <option value="Western Sahara">Western Sahara</option>
                                <option value="Yemen">Yemen</option>
                                <option value="Zambia">Zambia</option>
                                <option value="Zimbabwe">Zimbabwe</option>
                            </select>
                        </div>
                        <br />

                        <div class="form-group">
                            <label for="addressline1">Address line 1</label>
                            <input type="text" class="form-control" id="addressline1_2" name="addressline1_2" maxlength="50" placeholder="Address line 1">
                        </div>

                        <br />


                        <div class="form-group">
                            <label for="addressline2">Address line 2</label>
                            <input type="text" class="form-control" id="addressline2_2" name="addressline2_2" maxlength="50" placeholder="Address line 2">
                        </div>

                        <br />

                        <div class="form-group">
                            <label for="addressline3">Address line 3</label>
                            <input type="text" class="form-control" id="addressline3_2" name="addressline3_2" maxlength="50" placeholder="Address line 3">
                        </div>

                        <div class="form-group">
                            <label for="postalcode">Postal Code</label>
                            <input type="text" class="form-control" id="postal2" name="postal2" placeholder="Postal code" disabled>
                        </div>

                        <br />

                        <div class="form-group">
                            <label for="city">City Name</label> 
                            <input type="text" id="city2" class="form-control" name ="city2" maxlength="50" placeholder="City Name">
                        </div>

                        <br />


                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-4">
                                    <label for="state">State</label> 
                                    <select name="customerResidState2" class="form-control" id="customerResidState2">
                                        <option selected="selected" value="">Select State</option>
                                        <jsp:include page="/WEB-INF/jspf/nigerianstates.jspf"/>
                                    </select>
                                </div>


                                <div class="col-md-4"><label for="County">LGA</label>
                                    <select name="customerResidCity2" class="form-control" id="customerResidCity2">
                                        <option selected="selected" value="" class="">Choose State before LGA</option>
                                        <jsp:include page="/WEB-INF/jspf/nigerianlgas.jspf"/>
                                    </select>

                                </div>


                                <div class="col-md-4"><label for="operatingunit">Operating Unit</label>
                                    <select class="form-control" id="unit2" name="unit2">
                                        <option value="" selected="selected">Select</option>
                                        <option value="Nigeria">Nigeria</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <button type="button" id="remove_site" class="btn btn-primary btn-sm" onClick="removeSiteName()" >Remove Secondary Location</button>
                    </div>
                    <br /><br />
                    <strong><h4>Primary Contact Details</h4><h5>(We recommend that a Director/Prime Mover should be the Primary Contact)</h5></strong>
                    <div class="row">
                        <div class="form-group ">
                            <div class="col-md-4 required">
                                <label for="salutation">Salutation</label>
                                <select class="form-control" id="Salutation" name="salutation">
                                    <option value="">Please Select</option>
                                    <option value="Mr.">Mr.</option>
                                    <option value="Mrs.">Mrs.</option>
                                    <option value="Ms.">Ms.</option>
                                    <option value="Miss.">Miss.</option>
                                </select>
                            </div>


                        </div> 
                    </div>
                    <br />

                    <div class="row">


                        <div class="col-md-6 required"><label for="fname">First Name</label>
                            <input class="form-control" id = "fname" name="fname" placeholder="First Name" type="text" maxlength="50" required="true">
                        </div>
                        <div class="col-md-6 required">
                            <label for="lname">Last Name</label>
                            <input class="form-control" id = "lname" name="lname" placeholder="Last Name" type="text" maxlength="50" required="true">
                        </div>
                    </div>

                    <div class="form-group required">
                        <label for="dept">Department (Dept of Contact Person)</label>
                        <input class="form-control" id = "dept" name="dept" placeholder="Department (Dept of Contact Person)" type="text" maxlength="50" required="true">
                    </div>

                    <div class="form-group required">
                        
                            <label>Contact Number:</label><br />
                            <input type="number" name="child_1" id="child_1" class="form-control"/>
                            <!--  <button type="button" id="add_number" class="btn btn-primary btn-sm" onClick="addnumber()">add</button> -->
                      
                    </div>
                    <br />

                    <div class="form-group required">
                        
                            <label>Email Address:</label>
                            <input class="form-control" type="text"  name="chil_1" id="chil_1" maxlength="50" placeholder="Email Address"/><br/>
                            <!--   <button type="button" id="add_number" class="btn btn-primary btn-sm" onClick="addmail()">add</button> -->
                        
                    </div>
                    <button type="button" id="add_sec" class="btn btn-primary btn-sm" onclick="addSecDetails()">Add Secondary Contact Details</button>
                    <br /><br />



                    <div id="hide3">
                        <strong><h4>Secondary Contact Details (Optional)</h4></strong>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-4">
                                    <label for="salutation">Salutation</label>
                                    <select class="form-control" id="Salutation2" name="salutation2">
                                        <option value="">Please Select</option>
                                        <option value="Mr.">Mr.</option>
                                        <option value="Mrs.">Mrs.</option>
                                        <option value="Ms.">Ms.</option>
                                        <option value="Miss.">Miss.</option>
                                    </select>
                                </div>


                            </div> 
                        </div>
                        <br />

                        <div class="row">


                            <div class="col-md-6"><label for="fname">First Name</label>
                                <input class="form-control" id = "fname2" name="fname2" maxlength="50" placeholder="First Name" type="text">
                            </div>
                            <div class="col-md-6">
                                <label for="lname">Last Name</label>
                                <input class="form-control" id = "lname2" name="lname2" maxlength="50" placeholder="Last Name" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="dept">Department (Dept of Contact Person)</label>
                            <input class="form-control" id = "dept2" name="dept2" maxlength="50" placeholder="Department (Dept of Contact Person)" type="text">
                        </div>


                        <div id="addnumbers">
                            <label>Contact Number:</label><br />
                            <input type="number" name="child_1_2" id="child_1_2"   class="form-control"/>

                            <!--  <button type="button" id="add_number" class="btn btn-primary btn-sm" onClick="addnumber()">add</button> -->

                        </div>


                        <div id="addmail">
                            <label>Email Address:</label>
                            <input class="form-control" type="text"  name="chil_1_2" id="chil_1_2" maxlength="50" placeholder="Email Address"/><br/>
                            <!--   <button type="button" id="add_number" class="btn btn-primary btn-sm" onClick="addmail()">add</button> -->

                        </div>

                        <button type="button" id="remove_sec" class="btn btn-primary btn-sm" onclick="removeSecDetails()">Remove Secondary Contact Details</button>
                        <br /><br  />


                    </div> 



                           <div id="error2">
                      <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                       <strong>Danger! </strong>Please kindly remove special characters that are being sent or fill empty spaces left to be filled.
                      </div>
                    </div>


                    <button id="pre_btn1" class="btn btn-primary" onclick="prev_step1('first', 'second')" type="button">Previous</button>&emsp;
                    <button id="next_btn2" class="btn btn-primary" name="next" onclick="formValidate2()" type="button">Next</button>
                </fieldset>

                <fieldset id="third">
                    <h2 class="title">FirstBank Contact Information</h2>
                    <p class="subtitle">Step 3</p>
                    <div class="form-group required">
                        <label for="FBNdepartment">Head-Office Departments/Branch in the bank that Vendor deals with</label>
                        <select class="form-control" id="FBNdepartment" name="fbndepartment">
                              <option value="" selected="selected">--Choose--</option>
                            <c:forEach var="row" items="${result2.rows}">
                            <option value="${row.id}">${row.costcenters}</option>
                       </c:forEach>      
                        </select>
                     
                    </div>
                    <br />

                    <div class="form-group required">
                        <label for="contact">Staff Full Name</label>
                        <input class="form-control" id = "staffname" name="staffname" placeholder="Staff Name" type="text" maxlength="50" required="true">
                    </div>

                    <br />

                       <div id="error3">
                      <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                         <strong>Danger! </strong>Please kindly remove special characters that are being sent or fill empty spaces left to be filled.
                      </div>
                    </div>
                    <button id="pre_btn2" class="btn btn-primary" onclick="prev_step1('second', 'third')" type="button">Previous</button>&emsp;
                    <button id="next_btn2" class="btn btn-primary" name="next" onclick="formValidate3()" type="button">Next</button>
                </fieldset>


                <fieldset id="fourth">
                    <h2 class="title">Payment details</h2>
                    <p class="help-block">Information required in this section is for the corporate Bank Account</p>
                    <p class="subtitle">Step 4</p>
                    <div class="form-group required">
                        <label for="PaymentMethod">Payment Method</label>
                        <select class="form-control" id="payment" name="payment">
                            <option value="">--Choose--</option>
                            <option value="Cheque">Cheque</option>
                            <option value="EFT">Electronic Funds Transfer</option>
                        </select>
                    </div>
                    <br />

                    <div class="form-group required">
                        <label for="deliveryMethod">Payment Instructions Delivery method</label>
                        <select class="form-control" id="deliveryMethod" name="deliveryMethod">
                            <option value="Email">Email</option>
                        </select>
                    </div>
                    <br /> 


                    <div class="form-group required">
                        <label for="Email">Email Address(where payment instructions should be sent)</label>
                        <input type="text" class= "form-control" id = "eftemail" name="eftemail" maxlength="50" placeholder="Email Address (where payment instructions should be sent)" required="true">
                    </div>
                    
                    <hr>
                    <div class="form-group required">

                        <label>Invoice Currency</label>

                        <div id="addcurr">
                            <select class="form-control" id="Currencies" name="Currencies">
                                <option selected value="Nigerian NGN">Nigerian NGN</option>
                                <option value="America (United States) Dollars - USD">America (United States) Dollars – USD</option>
                                <option value="Afghanistan Afghanis - AFN">Afghanistan Afghanis – AFN</option>
                                <option value="Albania Leke - ALL">Albania Leke – ALL</option>
                                <option value="Algeria Dinars - DZD">Algeria Dinars – DZD</option>
                                <option value="Argentina Pesos - ARS">Argentina Pesos – ARS</option>
                                <option value="Australia Dollars - AUD">Australia Dollars – AUD</option>
                                <option value="Austria Schillings - ATS">Austria Schillings – ATS</OPTION>

                                <option value="Bahamas Dollars - BSD">Bahamas Dollars – BSD</option>
                                <option value="Bahrain Dinars - BHD">Bahrain Dinars – BHD</option>
                                <option value="Bangladesh Taka - BDT">Bangladesh Taka – BDT</option>
                                <option value="Barbados Dollars - BBD">Barbados Dollars – BBD</option>
                                <option value="Belgium Francs - BEF">Belgium Francs – BEF</OPTION>
                                <option value="Bermuda Dollars - BMD">Bermuda Dollars – BMD</option>

                                <option value="Brazil Reais - BRL">Brazil Reais – BRL</option>
                                <option value="Bulgaria Leva - BGN">Bulgaria Leva – BGN</option>
                                <option value="Canada Dollars - CAD">Canada Dollars – CAD</option>
                                <option value="CFA BCEAO Francs - XOF">CFA BCEAO Francs – XOF</option>
                                <option value="CFA BEAC Francs - XAF">CFA BEAC Francs – XAF</option>
                                <option value="Chile Pesos - CLP">Chile Pesos – CLP</option>

                                <option value="China Yuan Renminbi - CNY">China Yuan Renminbi – CNY</option>
                                <option value="RMB (China Yuan Renminbi) - CNY">RMB (China Yuan Renminbi) – CNY</option>
                                <option value="Colombia Pesos - COP">Colombia Pesos – COP</option>
                                <option value="CFP Francs - XPF">CFP Francs – XPF</option>
                                <option value="Costa Rica Colones - CRC">Costa Rica Colones – CRC</option>
                                <option value="Croatia Kuna - HRK">Croatia Kuna – HRK</option>

                                <option value="Cyprus Pounds - CYP">Cyprus Pounds – CYP</option>
                                <option value="Czech Republic Koruny - CZK">Czech Republic Koruny – CZK</option>
                                <option value="Denmark Kroner - DKK">Denmark Kroner – DKK</option>
                                <option value="Deutsche (Germany) Marks - DEM">Deutsche (Germany) Marks – DEM</OPTION>
                                <option value="Dominican Republic Pesos - DOP">Dominican Republic Pesos – DOP</option>
                                <option value="Dutch (Netherlands) Guilders - NLG">Dutch (Netherlands) Guilders – NLG</OPTION>

                                <option value="Eastern Caribbean Dollars - XCD">Eastern Caribbean Dollars – XCD</option>
                                <option value="Egypt Pounds - EGP">Egypt Pounds – EGP</option>
                                <option value="Estonia Krooni - EEK">Estonia Krooni – EEK</option>
                                <option value="Euro - EUR">Euro – EUR</option>
                                <option value="Fiji Dollars - FJD">Fiji Dollars – FJD</option>
                                <option value="Finland Markkaa - FIM">Finland Markkaa – FIM</OPTION>

                                <option value="France Francs - FRF*">France Francs – FRF*</OPTION>
                                <option value="Germany Deutsche Marks - DEM">Germany Deutsche Marks – DEM</OPTION>
                                <option value="Gold Ounces - XAU">Gold Ounces – XAU</option>
                                <option value="Greece Drachmae - GRD">Greece Drachmae – GRD</OPTION>
                                <option value="Guatemalan Quetzal - GTQ">Guatemalan Quetzal – GTQ</OPTION>
                                <option value="Holland (Netherlands) Guilders - NLG">Holland (Netherlands) Guilders – NLG</OPTION>
                                <option value="Hong Kong Dollars - HKD">Hong Kong Dollars – HKD</option>

                                <option value="Hungary Forint - HUF">Hungary Forint – HUF</option>
                                <option value="Iceland Kronur - ISK">Iceland Kronur – ISK</option>
                                <option value="IMF Special Drawing Right - XDR">IMF Special Drawing Right – XDR</option>
                                <option value="India Rupees - INR">India Rupees – INR</option>
                                <option value="Indonesia Rupiahs - IDR">Indonesia Rupiahs – IDR</option>
                                <option value="Iran Rials - IRR">Iran Rials – IRR</option>

                                <option value="Iraq Dinars - IQD">Iraq Dinars – IQD</option>
                                <option value="Ireland Pounds - IEP*">Ireland Pounds – IEP*</OPTION>
                                <option value="Israel New Shekels - ILS">Israel New Shekels – ILS</option>
                                <option value="Italy Lire - ITL*">Italy Lire – ITL*</OPTION>
                                <option value="Jamaica Dollars - JMD">Jamaica Dollars – JMD</option>
                                <option value="Japan Yen - JPY">Japan Yen – JPY</option>

                                <option value="Jordan Dinars - JOD">Jordan Dinars – JOD</option>
                                <option value="Kenya Shillings - KES">Kenya Shillings – KES</option>
                                <option value="Korea (South) Won - KRW">Korea (South) Won – KRW</option>
                                <option value="Kuwait Dinars - KWD">Kuwait Dinars – KWD</option>
                                <option value="Lebanon Pounds - LBP">Lebanon Pounds – LBP</option>
                                <option value="Luxembourg Francs - LUF">Luxembourg Francs – LUF</OPTION>

                                <option value="Malaysia Ringgits - MYR">Malaysia Ringgits – MYR</option>
                                <option value="Malta Liri - MTL">Malta Liri – MTL</option>
                                <option value="Mauritius Rupees - MUR">Mauritius Rupees – MUR</option>
                                <option value="Mexico Pesos - MXN">Mexico Pesos – MXN</option>
                                <option value="Morocco Dirhams - MAD">Morocco Dirhams – MAD</option>
                                <option value="Netherlands Guilders - NLG">Netherlands Guilders – NLG</OPTION>

                                <option value="New Zealand Dollars - NZD">New Zealand Dollars – NZD</option>
                                <option value="Norway Kroner - NOK">Norway Kroner – NOK</option>
                                <option value="Oman Rials - OMR">Oman Rials – OMR</option>
                                <option value="Pakistan Rupees - PKR">Pakistan Rupees – PKR</option>
                                <option value="Palladium Ounces - XPD">Palladium Ounces – XPD</option>
                                <option value="Peru Nuevos Soles - PEN">Peru Nuevos Soles – PEN</option>

                                <option value="Philippines Pesos - PHP">Philippines Pesos – PHP</option>
                                <option value="Platinum Ounces - XPT">Platinum Ounces – XPT</option>
                                <option value="Poland Zlotych - PLN">Poland Zlotych – PLN</option>
                                <option value="Portugal Escudos - PTE">Portugal Escudos – PTE</OPTION>
                                <option value="Qatar Riyals - QAR">Qatar Riyals – QAR</option>
                                <option value="Romania New Lei - RON">Romania New Lei – RON</option>

                                <option value="Romania Lei - ROL">Romania Lei – ROL</option>
                                <option value="Russia Rubles - RUB">Russia Rubles – RUB</option>
                                <option value="Saudi Arabia Riyals - SAR">Saudi Arabia Riyals – SAR</option>
                                <option value="Silver Ounces - XAG">Silver Ounces – XAG</option>
                                <option value="Singapore Dollars - SGD">Singapore Dollars – SGD</option>
                                <option value="Slovakia Koruny - SKK">Slovakia Koruny – SKK</option>

                                <option value="Slovenia Tolars - SIT">Slovenia Tolars – SIT</option>
                                <option value="South Africa Rand - ZAR">South Africa Rand – ZAR</option>
                                <option value="South Korea Won - KRW">South Korea Won – KRW</option>
                                <option value="Spain Pesetas - ESP">Spain Pesetas – ESP</OPTION>
                                <option value="Special Drawing Rights (IMF) - XDR">Special Drawing Rights (IMF) – XDR</option>
                                <option value="Sri Lanka Rupees - LKR">Sri Lanka Rupees – LKR</option>

                                <option value="Sudan Dinars - SDD">Sudan Dinars – SDD</option>
                                <option value="Sweden Kronor - SEK">Sweden Kronor – SEK</option>
                                <option value="Switzerland Francs - CHF">Switzerland Francs – CHF</option>
                                <option value="Taiwan New Dollars - TWD">Taiwan New Dollars – TWD</option>
                                <option value="Thailand Baht - THB">Thailand Baht – THB</option>
                                <option value="Trinidad and Tobago Dollars - TTD">Trinidad and Tobago Dollars – TTD</option>

                                <option value="Tunisia Dinars - TND">Tunisia Dinars – TND</option>
                                <option value="Turkey New Lira - TRY">Turkey New Lira – TRY</option>
                                <option value="United Arab Emirates Dirhams - AED">United Arab Emirates Dirhams – AED</option>
                                <option value="United Kingdom Pounds - GBP">United Kingdom Pounds – GBP</option>
                                <option value="United States Dollars - USD">United States Dollars – USD</option>
                                <option value="Venezuela Bolivares - VEB">Venezuela Bolivares – VEB</option>

                                <option value="Vietnam Dong - VND">Vietnam Dong – VND</option>
                                <option value="Zambia Kwacha - ZMK">Zambia Kwacha – ZMK</option>

                            </select>
                            <br />
                            <button type="button" id="add_currency" class="btn btn-primary btn-sm" onClick="addcurrency()">add</button><br />

                        </div>
                        <hr>
                    </div>



                    
                   
                    
                    <div class="form-group required">
                        <label for="paymentterms">Payment Terms</label>
                        <select class="form-control" id="paymentTerms" name="paymentterms">
                            <option selected value="30 days">30 days</option>
                        </select>
                    </div>
                    <br /> 

                    <div class="form-group required">
                        <label for="BankName">Bank Name</label>
                        <select class="form-control" name="bank_name" id="bank_name" onchange="chang4()">
                        <option value="">Please Select</option>
                         <!--<option value="Access Bank">Access Bank</option>
                            <option value="Citibank">Citibank</option>
                            <option value="Diamond Bank">Diamond Bank</option>
                            <option value="Ecobank Nigeria">Ecobank Nigeria</option>
                            <option value="Enterprise Bank Limited">Enterprise Bank Limited</option>
                            <option value="Fidelity Bank Nigeria">Fidelity Bank Nigeria</option> -->
                            <option value="First Bank of Nigeria Limited">First Bank of Nigeria Limited</option>
                          <!--  <option value="First City Monument Bank">First City Monument Bank</option>
                            <option value="Guaranty Trust Bank">Guaranty Trust Bank</option>
                            <option value="Heritage Bank">Heritage Bank</option>
                            <option value="Keystone Bank Limited">Keystone Bank Limited</option>
                            <option value="Mainstreet Bank Limited">Mainstreet Bank Limited</option>
                            <option value="Skye Bank">Skye Bank</option>
                            <option value="Stanbic IBTC Bank Ltd">Stanbic IBTC Bank Ltd</option>
                            <option value="Standard Chartered Bank">Standard Chartered Bank</option>
                            <option value="Sterling Bank">Sterling Bank</option>
                            <option value="SunTrust Bank Nigeria Limited">SunTrust Bank Nigeria Limited</option> 
                            <option value="Union Bank of Nigeria">Union Bank of Nigeria</option>
                            <option value="United Bank for Africa">United Bank for Africa</option>
                            <option value="Unity Bank PLC">Unity Bank PLC</option>
                            <option value="Wema Bank">Wema Bank</option>
                            <option value="Zenith Bank">Zenith Bank</option>-->
                            <option value="Others">Others (Foreign Bank Accounts Only) 
                            </option>
                        </select>
                    </div>

                    <div id = "visib4">
                        <div class="form-group required">
                        <label for="otherbanks">Other Bank Name (Foreign Bank Accounts Only)</label>
                        <input type="text" class="form-control" id="others4" name ="others4" maxlength="50" placeholder="Foreign Bank Accounts Only">
                        </div>
                    </div>
                    
                     <div id="swift">
                    <div class="form-group required">
                        <label for="swiftcode">Swift Code</label>
                        <input class="form-control" id = "swiftcode" name="swiftcode" maxlength="50" placeholder="Swift Code" type="text">
                    </div>
                         <div class="form-group">
                        <label for="IBAN">IBAN (For European Companies)</label>
                        <input class="form-control" id = "iban" name="iban" maxlength="50" placeholder="IBAN (For European Companies)" type="text">
                    </div>
                        
                    </div>
                    
                    <div id="hidebranch">
                        <div class="form-group required">
                    <label for="branchname">Select Branch Name</label>
                     <select class="form-control" id="bankbranchname" name="bankbranchname">
                            <option value="">--Choose--</option>
                            <option value="ABA (ABAYI)"> ABA (ABAYI)</option>
                            <option value="ABA (ALAOJI)"> ABA (ALAOJI)</option>
                            <option value="ABA (ASA ROAD 2)"> ABA (ASA ROAD 2)</option>
                            <option value="ABA (AZIKWE RD)"> ABA (AZIKWE RD)</option>
                            <option value="ABA (NGWA ROAD)"> ABA (NGWA ROAD)</option>
                            <option value="ABA (OGBOR HILL)"> ABA (OGBOR HILL)</option>
                            <option value="ABA (OKIGWE RD)"> ABA (OKIGWE RD)</option>
                            <option value="ABA (OSISIOMA)"> ABA (OSISIOMA)</option>
                            <option value="ABA ARIARIA MARKET">ABA ARIARIA MARKET</option>
                            <option value="ABA FACTORY ROAD">ABA FACTORY ROAD</option>
                            <option value="ABA MAIN">ABA MAIN</option>
                            <option value="ABA TOWN (EHI ROAD)"> ABA TOWN (EHI ROAD)</option>
                            <option value="ABAK MARKET">ABAK MARKET</option>
                            <option value="ABAKALIKI">ABAKALIKI</option>
                            <option value="ABAKALIKI II">ABAKALIKI II</option>
                            <option value="ABBA">ABBA</option>
                            <option value="ABEJUKOLO">ABEJUKOLO</option>
                            <option value="ABEOKUTA">ABEOKUTA</option>
                            <option value="ABEOKUTA (LAFENWA)"> ABEOKUTA (LAFENWA)</option>
                            <option value="ABEOKUTA (PANSEKE)"> ABEOKUTA (PANSEKE)</option>
                            <option value="ABIRIBA">ABIRIBA</option>
                            <option value="ABRAKA">ABRAKA</option>
                            <option value="ABU DHABI REP OFFICE">ABU DHABI REP OFFICE</option>
                            <option value="ABUJA (ABAJI)"> ABUJA (ABAJI)</option> 
                            <option value="ABUJA (AHMADU BELLO WAY)"> ABUJA (AHMADU BELLO WAY)</option>
                            <option value="ABUJA (AMINU KANO WAY)"> ABUJA (AMINU KANO WAY)</option>
                            <option value="ABUJA (ASOKORO) "> ABUJA (ASOKORO) </option>
                            <option value="ABUJA (BANEX PLAZA) "> ABUJA (BANEX PLAZA) </option>
                            <option value="ABUJA (BOLINGO HOTELS) "> ABUJA (BOLINGO HOTELS) </option>
                            <option value="ABUJA (DEIDEI) "> ABUJA (DEIDEI) </option>
                            <option value="ABUJA (GARKI ULTRA MODERN MKT)"> ABUJA (GARKI ULTRA MODERN MKT) </option>
                            <option value="ABUJA (GWARIMPA) "> ABUJA (GWARIMPA) </option>
                            <option value="ABUJA (INT.L AIRPORT)"> ABUJA (INT.L AIRPORT) </option>
                            <option value="ABUJA (JOS STREET)"> ABUJA (JOS STREET) </option>
                            <option value="ABUJA (KUJE) "> ABUJA (KUJE) </option>
                            <option value="ABUJA (MAITAMA II)"> ABUJA (MAITAMA II) </option>
                            <option value="ABUJA (MAITAMA)"> ABUJA (MAITAMA) </option>
                            <option value="ABUJA (NATIONAL ASSEMBLY)"> ABUJA (NATIONAL ASSEMBLY) </option>
                            <option value="ABUJA (NNPC) "> ABUJA (NNPC) </option>
                            <option value="ABUJA (SHIPPERS PLAZA) "> ABUJA (SHIPPERS PLAZA) </option>
                            <option value="ABUJA (UTAKO MARKET) "> ABUJA (UTAKO MARKET) </option>
                            <option value="ABUJA (UTAKO) "> ABUJA (UTAKO) </option>
                            <option value="ABUJA GARKI "> ABUJA GARKI </option>
                            <option value="ABUJA MAIN "> ABUJA MAIN </option>
                            <option value="ABUJA MPAPE "> ABUJA MPAPE </option>
                            <option value="ABUJA WUSE "> ABUJA WUSE </option>
                            <option value="ADEOLA HOPEWELL "> ADEOLA HOPEWELL </option>
                            <option value="ADO-EKITI "> ADO-EKITI </option>
                            <option value="AFIKPO "> AFIKPO </option>
                            <option value="AGBARHO "> AGBARHO </option>
                            <option value="AGBEDE "> AGBEDE </option>
                            <option value="AGBOR "> AGBOR </option>
                            <option value="AGBOWA "> AGBOWA </option>
                            <option value="AGIP ROUND ABOUT "> AGIP ROUND ABOUT </option>
                            <option value="AGRIC. UNIT "> AGRIC. UNIT </option>
                            <option value="AHABA IMENYI "> AHABA IMENYI </option>
                            <option value="AHOADA "> AHOADA </option>
                            <option value="AIYETORO-GBEDE "> AIYETORO-GBEDE </option>
                            <option value="AJAOKUTA "> AJAOKUTA </option>
                            <option value="AKAMKPA "> AKAMKPA </option>
                            <option value="AKANRAN-OLORUNSOGO "> AKANRAN-OLORUNSOGO </option>
                            <option value="AKATTA "> AKATTA </option>
                            <option value="AKOKWA "> AKOKWA </option>
                            <option value="AKPANYA "> AKPANYA </option>
                            <option value="AKURE (ADO-SECRETARIAT) "> AKURE (ADO-SECRETARIAT) </option>
                            <option value="AKURE (FUTA) "> AKURE (FUTA) </option>
                            <option value="AKURE (OBA ADESIDA) "> AKURE (OBA ADESIDA) </option>
                            <option value="AKURE MAIN "> AKURE MAIN </option>
                            <option value="AKURE MARKET "> AKURE MARKET </option>
                            <option value="AMAOKWE-ITEM "> AMAOKWE-ITEM </option>
                            <option value="AMARAKU "> AMARAKU </option>
                            <option value="ANKA "> ANKA </option>
                            <option value="ANKPA "> ANKPA </option>
                            <option value="ANTHONY "> ANTHONY </option>
                            <option value="ARAROMI-OBU "> ARAROMI-OBU </option>
                            <option value="AROCHUKWU "> AROCHUKWU </option>
                            <option value="AROMA "> AROMA </option>
                            <option value="ARTILLERY "> ARTILLERY </option>
                            <option value="ASABA "> ASABA </option>
                            <option value="ASABA(ILLAH ROAD) "> ASABA(ILLAH ROAD) </option>
                            <option value="ASHAKA CEMENT FACTORY "> ASHAKA CEMENT FACTORY </option>
                            <option value="AUCHI "> AUCHI </option>
                            <option value="AWE "> AWE </option>
                            <option value="AWKA "> AWKA </option>
                            <option value="AWKA (MAIN MARKET) "> AWKA (MAIN MARKET) </option>
                            <option value="AYANGBA "> AYANGBA </option>
                            <option value="AYOBO "> AYOBO </option>
                            <option value="AZARE "> AZARE </option>
                            <option value="BADDEGI "> BADDEGI </option>
                            <option value="BAKURA "> BAKURA </option>
                            <option value="BAMA "> BAMA </option>
                            <option value="BARAKIN-LADI "> BARAKIN-LADI </option>
                            <option value="BASSA "> BASSA </option>
                            <option value="BAUCHI "> BAUCHI </option>
                            <option value="BAUCHI (CENTRAL MKT) "> BAUCHI (CENTRAL MKT) </option>
                            <option value="BENIN (1ST EAST CIRCULAR RD) "> BENIN (1ST EAST CIRCULAR RD) </option>
                            <option value="BENIN (ADUWAWA) "> BENIN (ADUWAWA) </option>
                            <option value="BENIN (AKPAKPAVA) "> BENIN (AKPAKPAVA) </option>
                            <option value="BENIN (EKEHUAN RD) "> BENIN (EKEHUAN RD) </option>
                            <option value="BENIN (IYARO) "> BENIN (IYARO) </option>
                            <option value="BENIN (MURITALA MOHAMMED WAY) "> BENIN (MURITALA MOHAMMED WAY) </option>
                            <option value="BENIN (NEW BENIN MARKET) "> BENIN (NEW BENIN MARKET) </option>
                            <option value="BENIN (SAKPONBA ROAD) "> BENIN (SAKPONBA ROAD) </option>
                            <option value="BENIN (SAPELE ROAD) "> BENIN (SAPELE ROAD) </option>
                            <option value="BENIN (SILUKO ) "> BENIN (SILUKO ) </option>
                            <option value="BENIN (UPPER SAKPONBA) "> BENIN (UPPER SAKPONBA) </option>
                            <option value="BENIN (USELU) "> BENIN (USELU) </option>
                            <option value="BENIN AIRPORT RD "> BENIN AIRPORT RD </option>
                            <option value="BENIN KING SQU. "> BENIN KING SQU. </option>
                            <option value="BENIN MISS STR "> BENIN MISS STR </option>
                            <option value="BENIN OREGBENI "> BENIN OREGBENI </option>
                            <option value="BENIN UWELU "> BENIN UWELU </option>
                            <option value="BIC CONGO "> BIC CONGO </option>
                            <option value="BIDA "> BIDA </option>
                            <option value="BIRNIN GWARI "> BIRNIN GWARI </option>
                            <option value="BIRNIN-KEBBI "> BIRNIN-KEBBI </option>
                            <option value="BONNY "> BONNY </option>
                            <option value="BONNY HOSPITAL ROAD "> BONNY HOSPITAL ROAD </option>
                            <option value="BONNY NLNG "> BONNY NLNG </option>
                            <option value="BRANCH PROCESSING - OPS "> BRANCH PROCESSING - OPS </option>
                            <option value="BRASS "> BRASS </option>
                            <option value="BUKURU "> BUKURU </option>
                            <option value="BUNI YADI "> BUNI YADI </option>
                            <option value="BUSINESS PERFORMANCE MONITORING "> BUSINESS PERFORMANCE MONITORING </option>
                            <option value="BWARI "> BWARI </option>
                            <option value="CALABAR (8TH MILE) "> CALABAR (8TH MILE) </option>
                            <option value="CALABAR (IMAN JUNCTION) "> CALABAR (IMAN JUNCTION) </option>
                            <option value="CALABAR (MAYNE AVENUE) "> CALABAR (MAYNE AVENUE) </option>
                            <option value="CALABAR (NDIDEM ISO RD) "> CALABAR (NDIDEM ISO RD) </option>
                            <option value="CALABAR (TINAPA) "> CALABAR (TINAPA) </option>
                            <option value="CALABAR FTZ "> CALABAR FTZ </option>
                            <option value="CALABAR MAIN "> CALABAR MAIN </option>
                            <option value="CARDS AND CHANNELS "> CARDS AND CHANNELS </option>
                            <option value="Centralised Processing Centre "> Centralised Processing Centre </option>
                            <option value="CHIEF FINANCIAL OFFICER "> CHIEF FINANCIAL OFFICER </option>
                            <option value="CHINA REP OFFICE "> CHINA REP OFFICE </option>
                            <option value="CHOBA "> CHOBA </option>
                            <option value="CLASSIFIED ASSET MGT "> CLASSIFIED ASSET MGT </option>
                            <option value="COMMERCIAL BANKING GROUP "> COMMERCIAL BANKING GROUP </option>
                            <option value="COMP. SECRETARY "> COMP. SECRETARY </option>
                            <option value="COMPLIANCE DEPT. "> COMPLIANCE DEPT. </option>
                            <option value="CONSUMER BANKING "> CONSUMER BANKING </option>
                            <option value="CORP. PLANN. & GROUP COORD. "> CORP. PLANN. & GROUP COORD. </option>
                            <option value="CORPORATE BANKING "> CORPORATE BANKING </option>
                            <option value="CORPORATE TRANSFORMATION "> CORPORATE TRANSFORMATION </option>
                            <option value="CREDIT ANALYSIS & PROCESSING "> CREDIT ANALYSIS & PROCESSING </option>
                            <option value="CREDIT RISK MANAGEMENT "> CREDIT RISK MANAGEMENT </option>
                            <option value="CUSTOMER INSIGHT "> CUSTOMER INSIGHT </option>
                            <option value="DAMASK "> DAMASK </option>
                            <option value="DAMATURU "> DAMATURU </option>
                            <option value="DAMBATTA "> DAMBATTA </option>
                            <option value="DAMBOA "> DAMBOA </option>
                            <option value="DANDUME "> DANDUME </option>
                            <option value="DARAZO "> DARAZO </option>
                            <option value="DAURA "> DAURA </option>
                            <option value="DIASPORA BANKING "> DIASPORA BANKING </option>
                            <option value="DOMESTIC BKG  OPS. "> DOMESTIC BKG  OPS. </option>
                            <option value="DUTSE "> DUTSE </option>
                            <option value="ED (CORPORATE BANKING) "> ED (CORPORATE BANKING) </option>
                            <option value="ED (PUBLIC SECTOR NORTH) "> ED (PUBLIC SECTOR NORTH) </option>
                            <option value="ED (PUBLIC SECTOR SOUTH) "> ED (PUBLIC SECTOR SOUTH) </option>
                            <option value="ED (RETAIL BANKING NORTH) "> ED (RETAIL BANKING NORTH) </option>
                            <option value="ED (RETAIL BANKING SOUTH) "> ED (RETAIL BANKING SOUTH) </option>
                            <option value="ED (RISK MGT.&CONTROL.) "> ED (RISK MGT.&CONTROL.) </option>
                            <option value="EDE "> EDE </option>
                            <option value="EFA "> EFA </option>
                            <option value="EFFURUN "> EFFURUN </option>
                            <option value="EFON ALAYE "> EFON ALAYE </option>
                            <option value="EGBE "> EGBE </option>
                            <option value="EHA AMUFU "> EHA AMUFU </option>
                            <option value="EJIGBO "> EJIGBO </option>
                            <option value="EKET "> EKET </option>
                            <option value="EKONIRIM "> EKONIRIM </option>
                            <option value="EKORI "> EKORI </option>
                            <option value="EKPAN "> EKPAN </option>
                            <option value="EKPOMA "> EKPOMA </option>
                            <option value="EKWULOBIA "> EKWULOBIA </option>
                            <option value="EMURE EKITI "> EMURE EKITI </option>
                            <option value="ENUGU (2ND OKPARA AVE) "> ENUGU (2ND OKPARA AVE) </option>
                            <option value="ENUGU (9TH MILE CORNER) "> ENUGU (9TH MILE CORNER) </option>
                            <option value="ENUGU (ABAKPA NIKE) "> ENUGU (ABAKPA NIKE) </option>
                            <option value="ENUGU (AGBANI) "> ENUGU (AGBANI) </option>
                            <option value="ENUGU (EMENE IND. EST) "> ENUGU (EMENE IND. EST) </option>
                            <option value="ENUGU (EMENE IND. EST) "> ENUGU (EMENE IND. EST) </option>
                            <option value="ENUGU (NEW HAVEN) "> ENUGU (NEW HAVEN) </option>
                            <option value="ENUGU (NNPC DEPOT EMENE) "> ENUGU (NNPC DEPOT EMENE) </option>
                            <option value="ENUGU (OGBETE MKT) "> ENUGU (OGBETE MKT) </option>
                            <option value="ENUGU (OGBETE MKT) "> ENUGU (OGBETE MKT) </option>
                            <option value="ENUGU (UWANI) "> ENUGU (UWANI) </option>
                            <option value="ENUGU GARIKKI "> ENUGU GARIKKI </option>
                            <option value="ENUGU OGUI ROAD "> ENUGU OGUI ROAD </option>
                            <option value="ERIJIYAN EKITI "> ERIJIYAN EKITI </option>
                            <option value="ERIN OSUN "> ERIN OSUN </option>
                            <option value="ESSENE "> ESSENE </option>
                            <option value="ETINAN "> ETINAN </option>
                            <option value="EVP, TECHNOLOGY & SERVICES "> EVP, TECHNOLOGY & SERVICES </option>
                            <option value="EWEKORO "> EWEKORO </option>
                            <option value="EZZAMGBO "> EZZAMGBO </option>
                            <option value="FARINGADA "> FARINGADA </option>
                            <option value="FCE KONTOGORA "> FCE KONTOGORA </option>
                            <option value="FINANCIAL CONTROL "> FINANCIAL CONTROL </option>
                            <option value="FOREIGN OPERATIONS "> FOREIGN OPERATIONS </option>
                            <option value="FUFORE "> FUFORE </option>
                            <option value="FUNTUA "> FUNTUA </option>
                            <option value="GAMAWA "> GAMAWA </option>
                            <option value="GANYE "> GANYE </option>
                            <option value="GARKIDA "> GARKIDA </option>
                            <option value="GASHUA "> GASHUA </option>
                            <option value="GBOKO "> GBOKO </option>
                            <option value="GE, TREASURY & FINANCIAL INSTITUTIONS "> GE, TREASURY & FINANCIAL INSTITUTIONS </option>
                            <option value="GEIDEM "> GEIDEM </option>
                            <option value="GENERAL SERVICES "> GENERAL SERVICES </option>
                            <option value="GOMBE "> GOMBE </option>
                            <option value="GOMBE MARKET "> GOMBE MARKET </option>
                            <option value="GOMBI "> GOMBI </option>
                            <option value="GULAK "> GULAK </option>
                            <option value="GUMMI "> GUMMI </option>
                            <option value="GUSAU "> GUSAU </option>
                            <option value="GWAGWALADA "> GWAGWALADA </option>
                            <option value="HADEJIA "> HADEJIA </option>
                            <option value="HEAD OFFICE "> HEAD OFFICE </option>
                            <option value="HONG "> HONG </option>
                            <option value="HUMAN CAPITAL MANAGEMENT "> HUMAN CAPITAL MANAGEMENT </option>
                            <option value="IBADAN (AGODI) "> IBADAN (AGODI) </option>
                            <option value="IBADAN (APATA) "> IBADAN (APATA) </option>
                            <option value="IBADAN (BODIJA) "> IBADAN (BODIJA) </option>
                            <option value="IBADAN (ELEYELE) "> IBADAN (ELEYELE) </option>
                            <option value="IBADAN (IWO ROAD) "> IBADAN (IWO ROAD) </option>
                            <option value="IBADAN (MOKOLA) "> IBADAN (MOKOLA) </option>
                            <option value="IBADAN (NEW GBAGI MARKET) "> IBADAN (NEW GBAGI MARKET) </option>
                            <option value="IBADAN (NEW LEBANON RD) "> IBADAN (NEW LEBANON RD) </option>
                            <option value="IBADAN (OJOO) "> IBADAN (OJOO) </option>
                            <option value="IBADAN (OKE ADO) "> IBADAN (OKE ADO) </option>
                            <option value="IBADAN (OLUYOLE ESTATE) "> IBADAN (OLUYOLE ESTATE) </option>
                            <option value="IBADAN (TOWN PLANNING) "> IBADAN (TOWN PLANNING) </option>
                            <option value="IBADAN AMUNIGUN "> IBADAN AMUNIGUN </option>
                            <option value="IBADAN BANK RD (MAIN) "> IBADAN BANK RD (MAIN) </option>
                            <option value="IBADAN ORITA CHALLENGE "> IBADAN ORITA CHALLENGE </option>
                            <option value="IBADAN POLY "> IBADAN POLY </option>
                            <option value="IBADAN RING ROAD "> IBADAN RING ROAD </option>
                            <option value="IBADAN(MOLETE) "> IBADAN(MOLETE) </option>
                            <option value="IBAFO "> IBAFO </option>
                            <option value="IBENO QIT "> IBENO QIT </option>
                            <option value="ICB SUBSIDIARIES "> ICB SUBSIDIARIES </option>
                            <option value="IDANRE "> IDANRE </option>
                            <option value="IDO-ANI "> IDO-ANI </option>
                            <option value="IFAKI-EKITI "> IFAKI-EKITI </option>
                            <option value="IGBOGILA "> IGBOGILA </option>
                            <option value="IGBOKODA "> IGBOKODA </option>
                            <option value="IHIALA "> IHIALA </option>
                            <option value="IJEBU-JESA "> IJEBU-JESA </option>
                            <option value="IJEBU-ODE "> IJEBU-ODE </option>
                            <option value="IJEDE "> IJEDE </option>
                            <option value="IKARAM AKOKO "> IKARAM AKOKO </option>
                            <option value="IKARE "> IKARE </option>
                            <option value="IKEM "> IKEM </option>
                            <option value="IKENEGBU "> IKENEGBU </option>
                            <option value="IKERE EKITI "> IKERE EKITI </option>
                            <option value="IKIRE "> IKIRE </option>
                            <option value="IKIRUN "> IKIRUN </option>
                            <option value="IKOLE-EKITI "> IKOLE-EKITI </option>
                            <option value="IKOM "> IKOM </option>
                            <option value="IKOT ABASI "> IKOT ABASI </option>
                            <option value="IKOT EKPENE "> IKOT EKPENE </option>
                            <option value="IKOT EKPENE MARKET "> IKOT EKPENE MARKET </option>
                            <option value="ILASA-EKITI "> ILASA-EKITI </option>
                            <option value="ILE IFE "> ILE IFE </option>
                            <option value="ILE OLUJI "> ILE OLUJI </option>
                            <option value="ILESHA "> ILESHA </option>
                            <option value="ILLELA "> ILLELA </option>
                            <option value="ILORIN "> ILORIN </option>
                            <option value="ILORIN (SAWMILL) "> ILORIN (SAWMILL) </option>
                            <option value="ILORIN (SURULERE) "> ILORIN (SURULERE) </option>
                            <option value="INFORMATION SECURITY MGT "> INFORMATION SECURITY MGT </option>
                            <option value="INFORMATION TECHNOLOGY "> INFORMATION TECHNOLOGY </option>
                            <option value="INISHA "> INISHA </option>
                            <option value="INTERNAL AUDIT "> INTERNAL AUDIT </option>
                            <option value="INTERNAL CONTRL & RECONCILIATION "> INTERNAL CONTRL & RECONCILIATION </option>
                            <option value="INTERNATIONAL BANKING GROUP "> INTERNATIONAL BANKING GROUP </option>
                            <option value="INYI "> INYI </option>
                            <option value="IPAKODO "> IPAKODO </option>
                            <option value="IPETU IJESHA "> IPETU IJESHA </option>
                            <option value="IRE-AKARI "> IRE-AKARI </option>
                            <option value="ISANLU-YAGBA "> ISANLU-YAGBA </option>
                            <option value="ISEYIN "> ISEYIN </option>
                            <option value="ISOKUN-ILESHA "> ISOKUN-ILESHA </option>
                            <option value="IWO "> IWO </option>
                            <option value="IYAMOYE "> IYAMOYE </option>
                            <option value="JAKUSKO "> JAKUSKO </option>
                            <option value="JALINGO "> JALINGO </option>
                            <option value="JALINGO MARKET "> JALINGO MARKET </option>
                            <option value="JAMA'ARE "> JAMA'ARE </option>
                            <option value="JIBIA "> JIBIA </option>
                            <option value="JOS (MAIN) "> JOS (MAIN) </option>
                            <option value="JOS (MARKET) "> JOS (MARKET) </option>
                            <option value="JOS (SECRETARIAT) "> JOS (SECRETARIAT) </option>
                            <option value="KAANKIA "> KAANKIA </option>
                            <option value="KABBA "> KABBA </option>
                            <option value="KACHIA "> KACHIA </option>
                            <option value="KADUNA (BANK ROAD) "> KADUNA (BANK ROAD) </option>
                            <option value="KADUNA (CENTRAL MKT) "> KADUNA (CENTRAL MKT) </option>
                            <option value="KADUNA (KADUA JUNCTION RD) "> KADUNA (KADUA JUNCTION RD) </option>
                            <option value="KADUNA (MAIN) "> KADUNA (MAIN) </option>
                            <option value="KADUNA (PPMC) "> KADUNA (PPMC) </option>
                            <option value="KADUNA (TUNDUN WADA) "> KADUNA (TUNDUN WADA) </option>
                            <option value="KADUNA GRA "> KADUNA GRA </option>
                            <option value="KADUNA KAWO "> KADUNA KAWO </option>
                            <option value="KADUNA SOUTH "> KADUNA SOUTH </option>
                            <option value="KAFANCHAN "> KAFANCHAN </option>
                            <option value="KAGARA "> KAGARA </option>
                            <option value="KALTUNGO "> KALTUNGO </option>
                            <option value="KAMBA "> KAMBA </option>
                            <option value="KANO ( INT'L AIRPORT) "> KANO ( INT'L AIRPORT) </option>
                            <option value="KANO (ABUBAKAR RIMI MKT) "> KANO (ABUBAKAR RIMI MKT) </option>
                            <option value="KANO (BELLO ROAD) "> KANO (BELLO ROAD) </option>
                            <option value="KANO (BICHI) "> KANO (BICHI) </option>
                            <option value="KANO (BOMPAI) "> KANO (BOMPAI) </option>
                            <option value="KANO (DAWANAU) "> KANO (DAWANAU) </option>
                            <option value="KANO (FAGGE TA KUDU) "> KANO (FAGGE TA KUDU) </option>
                            <option value="KANO (HOTORO) "> KANO (HOTORO) </option>
                            <option value="KANO (KABUGA) "> KANO (KABUGA) </option>
                            <option value="KANO (KOFAR RUWA) "> KANO (KOFAR RUWA) </option>
                            <option value="KANO (KUST) "> KANO (KUST) </option>
                            <option value="KANO (MAIN) "> KANO (MAIN) </option>
                            <option value="KANO (ZARIA RD) "> KANO (ZARIA RD) </option>
                            <option value="KANO (ZOO ROAD) "> KANO (ZOO ROAD) </option>
                            <option value="KANO CLUB ROAD "> KANO CLUB ROAD </option>
                            <option value="KANO HADEIJA RD "> KANO HADEIJA RD </option>
                            <option value="KARIM LAMIDO "> KARIM LAMIDO </option>
                            <option value="KARU "> KARU </option>
                            <option value="KATAKO "> KATAKO </option>
                            <option value="KATCHIA "> KATCHIA </option>
                            <option value="KATSINA "> KATSINA </option>
                            <option value="KATSINA (DUTSINMA) "> KATSINA (DUTSINMA) </option>
                            <option value="KATSINA ALA "> KATSINA ALA </option>
                            <option value="KATSINA II "> KATSINA II </option>
                            <option value="KAURA NAMODA "> KAURA NAMODA </option>
                            <option value="KEFFI NASARAWA "> KEFFI NASARAWA </option>
                            <option value="KOGI STATE UNIV "> KOGI STATE UNIV </option>
                            <option value="KONTAGORA "> KONTAGORA </option>
                            <option value="KOSUBOSU "> KOSUBOSU </option>
                            <option value="KUBWA "> KUBWA </option>
                            <option value="KURGWI "> KURGWI </option>
                            <option value="KUTA "> KUTA </option>
                            <option value="LAFIA "> LAFIA </option>
                            <option value="LAGOS (ABIBU ADETORO) "> LAGOS (ABIBU ADETORO) </option>
                            <option value="LAGOS (ABIBU-OKI) "> LAGOS (ABIBU-OKI) </option>
                            <option value="LAGOS (ABULE-EGBA) "> LAGOS (ABULE-EGBA) </option>
                            <option value="LAGOS (ADEKUNLE) "> LAGOS (ADEKUNLE) </option>
                            <option value="LAGOS (ADEOLA ODEKU) "> LAGOS (ADEOLA ODEKU) </option>
                            <option value="LAGOS (ADETOKUMBO ADEMOLA) "> LAGOS (ADETOKUMBO ADEMOLA) </option>
                            <option value="LAGOS (AGBARA ESTATE) "> LAGOS (AGBARA ESTATE) </option>
                            <option value="LAGOS (AGEGE) "> LAGOS (AGEGE) </option>
                            <option value="LAGOS (AGINDINGBI) "> LAGOS (AGINDINGBI) </option>
                            <option value="LAGOS (AHMADU BELLO WAY) "> LAGOS (AHMADU BELLO WAY) </option>
                            <option value="LAGOS (AJAH MARKET) "> LAGOS (AJAH MARKET) </option>
                            <option value="LAGOS (AJAH) "> LAGOS (AJAH) </option>
                            <option value="LAGOS (AJAO ESTATE) "> LAGOS (AJAO ESTATE) </option>
                            <option value="LAGOS (AJEGUNLE TRINITY) "> LAGOS (AJEGUNLE TRINITY) </option>
                            <option value="LAGOS (AJEGUNLE) "> LAGOS (AJEGUNLE) </option>
                            <option value="LAGOS (AJOSE ADEOGUN) "> LAGOS (AJOSE ADEOGUN) </option>
                            <option value="LAGOS (AKOWONJO) "> LAGOS (AKOWONJO) </option>
                            <option value="LAGOS (AKUTE) "> LAGOS (AKUTE) </option>
                            <option value="LAGOS (ALABA II)"> LAGOS (ALABA II)</option>
                            <option value="LAGOS (ALABA INT'L MARKET)"> LAGOS (ALABA INT'L MARKET)</option>
                            <option value="LAGOS (ALABA-SURU)"> LAGOS (ALABA-SURU)</option>
                            <option value="LAGOS (ALAPERE)"> LAGOS (ALAPERE)</option>
                            <option value="LAGOS (ALAUSA SEC.)"> LAGOS (ALAUSA SEC.)</option>
                            <option value="LAGOS (APAPA POINT RD)"> LAGOS (APAPA POINT RD)</option>
                            <option value="LAGOS (APAPA)"> LAGOS (APAPA)</option>
                            <option value="LAGOS (AWOLOWO ROAD IKOYI)"> LAGOS (AWOLOWO ROAD IKOYI)</option>
                            <option value="LAGOS (BADAGRY)"> LAGOS (BADAGRY)</option>
                            <option value="LAGOS (BADORE-AJAH)"> LAGOS (BADORE-AJAH)</option>
                            <option value="LAGOS (BALOGUN)"> LAGOS (BALOGUN)</option>
                            <option value="LAGOS (BARIGA)"> LAGOS (BARIGA)</option>
                            <option value="LAGOS (BROAD STREET.)"> LAGOS (BROAD STREET.)</option>
                            <option value="LAGOS (CHEVRON)"> LAGOS (CHEVRON)</option>
                            <option value="LAGOS (CREEK ROAD APAPA)"> LAGOS (CREEK ROAD APAPA)</option>
                            <option value="LAGOS (DALEKO MKT)"> LAGOS (DALEKO MKT)</option>
                            <option value="LAGOS (DOPEMU)"> LAGOS (DOPEMU)</option>
                            <option value="LAGOS (DOSUNMU)"> LAGOS (DOSUNMU)</option>
                            <option value="LAGOS (EBUTE-METTA)"> LAGOS (EBUTE-METTA)</option>
                            <option value="LAGOS (EKO-HOTEL)"> LAGOS (EKO-HOTEL)</option>
                            <option value="LAGOS (EPE)"> LAGOS (EPE)</option>
                            <option value="LAGOS (FALOMO SHOPPING)"> LAGOS (FALOMO SHOPPING)</option>
                            <option value="LAGOS (FED. SECRETARIAT)"> LAGOS (FED. SECRETARIAT)</option>
                            <option value="LAGOS (FESTAC II)"> LAGOS (FESTAC II)</option>
                            <option value="LAGOS (FESTAC TOWN)"> LAGOS (FESTAC TOWN)</option>
                            <option value="LAGOS (GORODOMU)"> LAGOS (GORODOMU)</option>
                            <option value="LAGOS (IDDO)"> LAGOS (IDDO)</option>
                            <option value="LAGOS (IDIMU)"> LAGOS (IDIMU)</option>
                            <option value="LAGOS (IFAKO-GBAGADA)"> LAGOS (IFAKO-GBAGADA)</option>
                            <option value="LAGOS (IGANDO)"> LAGOS (IGANDO)</option>
                            <option value="LAGOS (IGANMU IND. EST.)"> LAGOS (IGANMU IND. EST.)</option>
                            <option value="LAGOS (IJAIYE ROAD)"> LAGOS (IJAIYE ROAD)</option>
                            <option value="LAGOS (IJORA)"> LAGOS (IJORA)</option>
                            <option value="LAGOS (IJU)"> LAGOS (IJU)</option>
                            <option value="LAGOS (IKEJA ALLEN AVE)"> LAGOS (IKEJA ALLEN AVE)</option>
                            <option value="LAGOS (IKEJA CANTONEMENT)"> LAGOS (IKEJA CANTONEMENT)</option>
                            <option value="LAGOS (IKEJA IND. EST.)"> LAGOS (IKEJA IND. EST.)</option>
                            <option value="LAGOS (IKEJA)"> LAGOS (IKEJA)</option>
                            <option value="LAGOS (IKORODU)"> LAGOS (IKORODU)</option>
                            <option value="LAGOS (IKOTA INT'L SHOPP. COMP.)"> LAGOS (IKOTA INT'L SHOPP. COMP.)</option>
                            <option value="LAGOS (IKOTUN II)"> LAGOS (IKOTUN II)</option>
                            <option value="LAGOS (IKOTUN)"> LAGOS (IKOTUN)</option>
                            <option value="LAGOS (ILUPEJU IND EST)"> LAGOS (ILUPEJU IND EST)</option>
                            <option value="LAGOS (INVESTMENT HOUSE)"> LAGOS (INVESTMENT HOUSE)</option>
                            <option value="LAGOS (ISOLO IND.EST)"> LAGOS (ISOLO IND.EST)</option>
                            <option value="LAGOS (ISOLO)"> LAGOS (ISOLO)</option>
                            <option value="LAGOS (IYANA IPAJA)"> LAGOS (IYANA IPAJA)</option>
                            <option value="LAGOS (JIBOWU)"> LAGOS (JIBOWU)</option>
                            <option value="LAGOS (KEFFI ROAD)"> LAGOS (KEFFI ROAD)</option>
                            <option value="LAGOS (KETU)"> LAGOS (KETU)</option>
                            <option value="LAGOS (KOFO ABAYOMI LEKKI/VI)"> LAGOS (KOFO ABAYOMI LEKKI/VI)</option>
                            <option value="LAGOS (KOFO-ABAYOMI)"> LAGOS (KOFO-ABAYOMI)</option>
                            <option value="LAGOS (LAPAL HOUSE)"> LAGOS (LAPAL HOUSE)</option>
                            <option value="LAGOS (LAWANSON)"> LAGOS (LAWANSON)</option>
                            <option value="LAGOS (LEKKI)"> LAGOS (LEKKI)</option>
                            <option value="LAGOS (M. MOHAMMED WAY)"> LAGOS (M. MOHAMMED WAY)</option>
                            <option value="LAGOS (MAGODO)"> LAGOS (MAGODO)</option>
                            <option value="LAGOS (MARYLAND)"> LAGOS (MARYLAND)</option>
                            <option value="LAGOS (MATORI)"> LAGOS (MATORI)</option>
                            <option value="LAGOS (MAZA MAZA)"> LAGOS (MAZA MAZA)</option>
                            <option value="LAGOS (MOLONEY ST.)"> LAGOS (MOLONEY ST.)</option>
                            <option value="LAGOS (MURTALA MOHAMMED AIRPORT)"> LAGOS (MURTALA MOHAMMED AIRPORT)</option>
                            <option value="LAGOS (MUSHIN)"> LAGOS (MUSHIN)</option>
                            <option value="LAGOS (NAVY TOWN OJO)"> LAGOS (NAVY TOWN OJO)</option>
                            <option value="LAGOS (NIGER HOUSE)"> LAGOS (NIGER HOUSE)</option>
                            <option value="LAGOS (NIJ HOUSE)"> LAGOS (NIJ HOUSE)</option>
                            <option value="LAGOS (OBA AKRAN AVENUE)"> LAGOS (OBA AKRAN AVENUE)</option>
                            <option value="LAGOS (OBUN EKO)"> LAGOS (OBUN EKO)</option>
                            <option value="LAGOS (OGBA)"> LAGOS (OGBA)</option>
                            <option value="LAGOS (OGUDU)"> LAGOS (OGUDU)</option>
                            <option value="LAGOS (OJODU-ISHERI)"> LAGOS (OJODU-ISHERI)</option>
                            <option value="LAGOS (OKE-ARIN MKT.)"> LAGOS (OKE-ARIN MKT.)</option>
                            <option value="LAGOS (OKE-ODO)"> LAGOS (OKE-ODO)</option>
                            <option value="LAGOS (OKOTA)"> LAGOS (OKOTA)</option>
                            <option value="LAGOS (ONIRU)"> LAGOS (ONIRU)</option>
                            <option value="LAGOS (OPEBI)"> LAGOS (OPEBI)</option>
                            <option value="LAGOS (OREGUN)"> LAGOS (OREGUN)</option>
                            <option value="LAGOS (ORILE COKER)"> LAGOS (ORILE COKER)</option>
                            <option value="LAGOS (OSAPA LONDON)"> LAGOS (OSAPA LONDON)</option>
                            <option value="LAGOS (OSHODI)"> LAGOS (OSHODI)</option>
                            <option value="LAGOS (OSHODI-MILE 2 EXPRESS)"> LAGOS (OSHODI-MILE 2 EXPRESS)</option>
                            <option value="LAGOS (PROGRESSIVE MKT)"> LAGOS (PROGRESSIVE MKT)</option>
                            <option value="LAGOS (SAKA-TINUBU)"> LAGOS (SAKA-TINUBU)</option>
                            <option value="LAGOS (SANUSI FAFUNWA)"> LAGOS (SANUSI FAFUNWA)</option>
                            <option value="LAGOS (SAUDI EKO)"> LAGOS (SAUDI EKO)</option>
                            <option value="LAGOS (SEME BORDER)"> LAGOS (SEME BORDER)</option>
                            <option value="LAGOS (SHOMOLU)"> LAGOS (SHOMOLU)</option>
                            <option value="LAGOS (STOCK EXCHANGE)"> LAGOS (STOCK EXCHANGE)</option>
                            <option value="LAGOS (SURULERE SHOPPING CENTRE)"> LAGOS (SURULERE SHOPPING CENTRE)</option>
                            <option value="LAGOS (SURULERE)"> LAGOS (SURULERE)</option>
                            <option value="LAGOS (TEJUOSHO)"> LAGOS (TEJUOSHO)</option>
                            <option value="LAGOS (TIN CAN ISLAND)"> LAGOS (TIN CAN ISLAND)</option>
                            <option value="LAGOS (TOYIN-OLOWU)"> LAGOS (TOYIN-OLOWU)</option>
                            <option value="LAGOS (TRADE FAIR)"> LAGOS (TRADE FAIR)</option>
                            <option value="LAGOS (UNI.OF LAGOS)"> LAGOS (UNI.OF LAGOS)</option>
                            <option value="LAGOS (VICTORIA GARDEN CITY)"> LAGOS (VICTORIA GARDEN CITY)</option>
                            <option value="LAGOS (WESTERN HOUSE)"> LAGOS (WESTERN HOUSE)</option>
                            <option value="LAGOS (WILLOUGHBY)"> LAGOS (WILLOUGHBY)</option>
                            <option value="LAGOS (YABA)"> LAGOS (YABA)</option>
                            <option value="LAGOS NICHEMTEX (OWODE)"> LAGOS NICHEMTEX (OWODE)</option>
                            <option value="LAGOS(ITA-ELEWA)"> LAGOS(ITA-ELEWA)</option>
                            <option value="LANGTANG">LANGTANG</option>
                            <option value="LAPAI">LAPAI</option>
                            <option value="LASPOTECH">LASPOTECH</option>
                            <option value="LEGAL SERVICES">LEGAL SERVICES</option>
                            <option value="LOKOJA">LOKOJA</option>
                            <option value="LOKOJA (NIPOST)"> LOKOJA (NIPOST)</option>
                            <option value="LOKOJA(OBAJANA)"> LOKOJA(OBAJANA)</option>
                            <option value="LWR - LAGOS MAINLAND - ISAAC JOHN TEAM">LWR - LAGOS MAINLAND - ISAAC JOHN TEAM</option>
                            <option value="MAIDUGURI (BAGGA RD)"> MAIDUGURI (BAGGA RD)</option>
                            <option value="MAIDUGURI (KANO RD)"> MAIDUGURI (KANO RD)</option>
                            <option value="MAIDUGURI MAIN">MAIDUGURI MAIN</option>
                            <option value="MAIYAMA">MAIYAMA</option>
                            <option value="MAKURDI">MAKURDI</option>
                            <option value="MAKURDI (NORTH BANK)"> MAKURDI (NORTH BANK)</option>
                            <option value="MAKURDI(MODERN MKT)"> MAKURDI(MODERN MKT)</option>
                            <option value="MALLUM FASHI">MALLUM FASHI</option>
                            <option value="MANG. DIRECTOR'S OFFICE">MANG. DIRECTOR'S OFFICE</option>
                            <option value="MANGU">MANGU</option>
                            <option value="MARARABA">MARARABA</option>
                            <option value="MARINA">MARINA</option>
                            <option value="MARKET & LIQUIDITY RISK MGT">MARKET & LIQUIDITY RISK MGT</option>
                            <option value="MAYFAIR">MAYFAIR</option>
                            <option value="MAYO BELWA">MAYO BELWA</option>
                            <option value="MBAISE">MBAISE</option>
                            <option value="MICHIKA">MICHIKA</option>
                            <option value="MIDDLE OFFICE">MIDDLE OFFICE</option>
                            <option value="MINNA">MINNA</option>
                            <option value="MINNA TUNGA">MINNA TUNGA</option>
                            <option value="MISAU">MISAU</option>
                            <option value="MKT.& CORP COMMUNICATION">MKT.& CORP COMMUNICATION</option>
                            <option value="MOPA">MOPA</option>
                            <option value="MOSINMI">MOSINMI</option>
                            <option value="MOWE">MOWE</option>
                            <option value="MUBI">MUBI</option>
                            <option value="NEW BODIJA">NEW BODIJA</option>
                            <option value="NEW EMEKULU">NEW EMEKULU</option>
                            <option value="NEW MAIDUGURI (M.MKT)"> NEW MAIDUGURI (M.MKT)</option>
                            <option value="NEW WUSE MKT">NEW WUSE MKT</option>
                            <option value="NGURU">NGURU</option>
                            <option value="NIMO">NIMO</option>
                            <option value="NINGI">NINGI</option>
                            <option value="NKPOR">NKPOR</option>
                            <option value="NKPOR (BUILDING MAT.)"> NKPOR (BUILDING MAT.)</option>
                            <option value="NKPOR (LIMCA ROAD)"> NKPOR (LIMCA ROAD)</option>
                            <option value="NKWELLE EZUNAKA">NKWELLE EZUNAKA</option>
                            <option value="NKWERRE">NKWERRE</option>
                            <option value="NKWOAGU-ISUOCHI">NKWOAGU-ISUOCHI</option>
                            <option value="NNEWI">NNEWI</option>
                            <option value="NNEWI  BANK ROAD">NNEWI  BANK ROAD</option>
                            <option value="NNEWI BUILDING MKT">NNEWI BUILDING MKT</option>
                            <option value="NSUKKA">NSUKKA</option>
                            <option value="NUMAN">NUMAN</option>
                            <option value="NYANYAN">NYANYAN</option>
                            <option value="OAU">OAU</option>
                            <option value="OBOLLO-AFO">OBOLLO-AFO</option>
                            <option value="OBUBRA">OBUBRA</option>
                            <option value="OBUDU">OBUDU</option>
                            <option value="ODEOMU">ODEOMU</option>
                            <option value="ODI">ODI</option>
                            <option value="OFFA">OFFA</option>
                            <option value="OFFA GARAGE">OFFA GARAGE</option>
                            <option value="OGBERE">OGBERE</option>
                            <option value="OGBOMOSHO">OGBOMOSHO</option>
                            <option value="OGBUNIKE">OGBUNIKE</option>
                            <option value="OGOJA">OGOJA</option>
                            <option value="OGORI">OGORI</option>
                            <option value="OGUMA">OGUMA</option>
                            <option value="OGWASHI-UKU">OGWASHI-UKU</option>
                            <option value="OJI RIVER">OJI RIVER</option>
                            <option value="OJUELEGBA">OJUELEGBA</option>
                            <option value="OKA AKOKO">OKA AKOKO</option>
                            <option value="OKE ARO">OKE ARO</option>
                            <option value="OKEFIA">OKEFIA</option>
                            <option value="OKEHO">OKEHO</option>
                            <option value="OKEMESI">OKEMESI</option>
                            <option value="OKENE">OKENE</option>
                            <option value="OKIGWE">OKIGWE</option>
                            <option value="OKITIPUPA">OKITIPUPA</option>
                            <option value="OKO">OKO</option>
                            <option value="OKWELLE">OKWELLE</option>
                            <option value="OMOKU">OMOKU</option>
                            <option value="OMU-ARAN">OMU-ARAN</option>
                            <option value="OMUNZE">OMUNZE</option>
                            <option value="ONDO">ONDO</option>
                            <option value="ONDO (SABO)"> ONDO (SABO)</option>
                            <option value="ONITSHA (ELECTROMART)"> ONITSHA (ELECTROMART)</option>
                            <option value="ONITSHA (MAIN)"> ONITSHA (MAIN)</option>
                            <option value="ONITSHA (OGBARU MARKET)"> ONITSHA (OGBARU MARKET)</option>
                            <option value="ONITSHA (UPPER IWEKA ROAD)"> ONITSHA (UPPER IWEKA ROAD)</option>
                            <option value="ONITSHA BRIDGE HEAD">ONITSHA BRIDGE HEAD</option>
                            <option value="ONITSHA IWEKA ROAD">ONITSHA IWEKA ROAD</option>
                            <option value="ONITSHA NWOBODO AVENUE">ONITSHA NWOBODO AVENUE</option>
                            <option value="ONITSHA UPPER NEW MKT RD">ONITSHA UPPER NEW MKT RD</option>
                            <option value="ONITSHA WILLIAMS STREET">ONITSHA WILLIAMS STREET</option>
                            <option value="ONITSHA(BUILDING MAT. OGIDI)"> ONITSHA(BUILDING MAT. OGIDI)</option>
                            <option value="ONITSHA-OWERRI ROAD">ONITSHA-OWERRI ROAD</option>
                            <option value="ONNE">ONNE</option>
                            <option value="OPERATIONAL RISK MGT">OPERATIONAL RISK MGT</option>
                            <option value="OPOPOGBORO">OPOPOGBORO</option>
                            <option value="ORBA MKT">ORBA MKT</option>
                            <option value="ORE">ORE</option>
                            <option value="ORLU">ORLU</option>
                            <option value="ORO">ORO</option>
                            <option value="ORON">ORON</option>
                            <option value="OSHOGBO">OSHOGBO</option>
                            <option value="OSHOGBO (AIYETORO)"> OSHOGBO (AIYETORO)</option>
                            <option value="OSHOGBO (GBONGAN)"> OSHOGBO (GBONGAN)</option>
                            <option value="OTA">OTA</option>
                            <option value="OTA-II">OTA-II</option>
                            <option value="OTUOCHA">OTUOCHA</option>
                            <option value="OTURKPO">OTURKPO</option>
                            <option value="OTURKPO MARKET">OTURKPO MARKET</option>
                            <option value="OVOKO">OVOKO</option>
                            <option value="OWERRI (AWOMAMA)"> OWERRI (AWOMAMA)</option>
                            <option value="OWERRI (DOUGLAS ROAD)"> OWERRI (DOUGLAS ROAD)</option>
                            <option value="OWERRI (MBANO)"> OWERRI (MBANO)</option>
                            <option value="OWERRI (ORJI)">OWERRI (ORJI)</option>
                            <option value="OWERRI (ORLU ROAD)"> OWERRI (ORLU ROAD)</option>
                            <option value="OWERRI (PH ROAD)"> OWERRI (PH ROAD)</option>
                            <option value="OWERRI (WETHERAL ROAD)"> OWERRI (WETHERAL ROAD)</option>
                            <option value="OWERRI MAIN">OWERRI MAIN</option>
                            <option value="OWO">OWO</option>
                            <option value="OYIGBO">OYIGBO</option>
                            <option value="OYO">OYO</option>
                            <option value="OYO (YEMETU)"> OYO (YEMETU)</option>
                            <option value="OYO II">OYO II</option>
                            <option value="OZORO">OZORO</option>
                            <option value="PATANI">PATANI</option>
                            <option value="PH (ABULOMA)"> PH (ABULOMA)</option>
                            <option value="PH (CHURCHILL)"> PH (CHURCHILL)</option>
                            <option value="PH (ELIOZU)"> PH (ELIOZU)</option>
                            <option value="PH (OGINIGBA)"> PH (OGINIGBA)</option>
                            <option value="PH (RUMUODARA)"> PH (RUMUODARA)</option>
                            <option value="PH (RUMUOKORO)"> PH (RUMUOKORO)</option>
                            <option value="PH (WIMPEY)"> PH (WIMPEY)</option>
                            <option value="PH (WOJI)"> PH (WOJI)</option>
                            <option value="Polo Park Branch">Polo Park Branch</option>
                            <option value="PORT HARCOURT (DIOBU)"> PORT HARCOURT (DIOBU)</option>
                            <option value="PORT HARCOURT (GARRISSON)"> PORT HARCOURT (GARRISSON)</option>
                            <option value="PORT HARCOURT (MAIN)"> PORT HARCOURT (MAIN)</option>
                            <option value="PORT HARCOURT (OLU OBASANJO RD)"> PORT HARCOURT (OLU OBASANJO RD)</option>
                            <option value="PORT HARCOURT (RUMUKRUSHI)"> PORT HARCOURT (RUMUKRUSHI)</option>
                            <option value="PORT HARCOURT (RUMUOLA)"> PORT HARCOURT (RUMUOLA)</option>
                            <option value="PORT HARCOURT (RUMUOMASI)"> PORT HARCOURT (RUMUOMASI)</option>
                            <option value="PORT HARCOURT (SHELL)"> PORT HARCOURT (SHELL)</option>
                            <option value="PORT HARCOURT (STADIUM ROAD)"> PORT HARCOURT (STADIUM ROAD)</option>
                            <option value="PORT HARCOURT (STATION RD)"> PORT HARCOURT (STATION RD)</option>
                            <option value="PORT HARCOURT (T/AMADI)"> PORT HARCOURT (T/AMADI)</option>
                            <option value="PORT HARCOURT (TOWN) HABOUR RD">PORT HARCOURT (TOWN) HABOUR RD</option>
                            <option value="PORT HARCOURT REFINERY">PORT HARCOURT REFINERY</option>
                            <option value="POTISKUM">POTISKUM</option>
                            <option value="PRIVATE BANKING">PRIVATE BANKING</option>
                            <option value="PRIVATE BANKING (ABUJA HUB)"> PRIVATE BANKING (ABUJA HUB)</option>
                            <option value="PRIVATE BANKING (LAGOS HUB)"> PRIVATE BANKING (LAGOS HUB)</option>
                            <option value="PRIVATE BANKING (PH HUB)"> PRIVATE BANKING (PH HUB)</option>
                            <option value="PROCESS REVIEW AND AUTOMATION (OPS)"> PROCESS REVIEW AND AUTOMATION (OPS)</option>
                            <option value="PROCUREMENT">PROCUREMENT</option>
                            <option value="PRODUCTS &CHANNELS">PRODUCTS &CHANNELS</option>
                            <option value="PROJECT MGT. & AUTOMATION">PROJECT MGT. & AUTOMATION</option>
                            <option value="PROTOCOL">PROTOCOL</option>
                            <option value="REMEDIAL MGT">REMEDIAL MGT</option>
                            <option value="RH (RETAIL BANKING LAGOS & WEST">RH (RETAIL BANKING LAGOS & WEST</option>
                            <option value="RIJAU">RIJAU</option>
                            <option value="SABONGIDA ORA">SABONGIDA ORA</option>
                            <option value="SALARIES">SALARIES</option>
                            <option value="SAMARU">SAMARU</option>
                            <option value="SAMINAKA">SAMINAKA</option>
                            <option value="SAPELE MAIN">SAPELE MAIN</option>
                            <option value="SAPELE MARKET /BOYO">SAPELE MARKET /BOYO</option>
                            <option value="SECURITY DEPARTMENT">SECURITY DEPARTMENT</option>
                            <option value="SERVICE MANAGEMENT - OPS">SERVICE MANAGEMENT - OPS</option>
                            <option value="SHAGAMU">SHAGAMU</option>
                            <option value="SHAKI">SHAKI</option>
                            <option value="SHARE">SHARE</option>
                            <option value="SHENDAM">SHENDAM</option>
                            <option value="SHINKAFI">SHINKAFI</option>
                            <option value="SOKOTO (DANFODIO ROAD)"> SOKOTO (DANFODIO ROAD)</option>
                            <option value="SOKOTO (RIJIYA)"> SOKOTO (RIJIYA)</option>
                            <option value="SOKOTO MAIN">SOKOTO MAIN</option>
                            <option value="SOUTH AFRICA REP OFFICE">SOUTH AFRICA REP OFFICE</option>
                            <option value="SPECIALIZED LENDING DEPARTMENT">SPECIALIZED LENDING DEPARTMENT</option>
                            <option value="STCF">STCF</option>
                            <option value="SUBSIDIARIES FINANCE AND CAPITAL MGT">SUBSIDIARIES FINANCE AND CAPITAL MGT</option>
                            <option value="SULEJA">SULEJA</option>
                            <option value="SULEJA (ALUMINIUM VILLAGE)"> SULEJA (ALUMINIUM VILLAGE)</option>
                            <option value="SULEJA MARKET">SULEJA MARKET</option>
                            <option value="SURULERE (AGUDA)"> SURULERE (AGUDA)</option>
                            <option value="TAFAWA BELEWA">TAFAWA BELEWA</option>
                            <option value="TALATA MAFARA">TALATA MAFARA</option>
                            <option value="TAMBAWAL">TAMBAWAL</option>
                            <option value="TORO">TORO</option>
                            <option value="TRAINING & DEVELOPMENT">TRAINING & DEVELOPMENT</option>
                            <option value="TREASURY & FUNDS MGT."> TREASURY & FUNDS MGT</option>
                            <option value="UBA (KUMAGUN)"> UBA (KUMAGUN)</option>
                            <option value="UCH">UCH</option>
                            <option value="UDU">UDU</option>
                            <option value="UGBOWO">UGBOWO</option>
                            <option value="UGEP">UGEP</option>
                            <option value="UGHELI">UGHELI</option>
                            <option value="UGHELLI (DUMEZ RD)"> UGHELLI (DUMEZ RD)</option>
                            <option value="UGWU AGBA OBOSI">UGWU AGBA OBOSI</option>
                            <option value="UKAM">UKAM</option>
                            <option value="UMUAHIA">UMUAHIA</option>
                            <option value="UMUAHIA (MARKET)"> UMUAHIA (MARKET)</option>
                            <option value="UMUAHIA (OZUAKOLAB)"> UMUAHIA (OZUAKOLAB)</option>
                            <option value="UMUOWA">UMUOWA</option>
                            <option value="UNIBEN">UNIBEN</option>
                            <option value="UNIV. OF NIGERIA, NSUKKA">UNIV. OF NIGERIA, NSUKKA</option>
                            <option value="UNIVERSITY OF CALABAR">UNIVERSITY OF CALABAR</option>
                            <option value="UNIVERSITY OF IBADAN">UNIVERSITY OF IBADAN</option>
                            <option value="UNIVERSITY OF JOS">UNIVERSITY OF JOS</option>
                            <option value="UNIZIK AWKA">UNIZIK AWKA</option>
                            <option value="UROMI">UROMI</option>
                            <option value="URUALLA">URUALLA</option>
                            <option value="UTU ETIM EKPO">UTU ETIM EKPO</option>
                            <option value="UYO">UYO</option>
                            <option value="UYO (ITIAM)"> UYO (ITIAM)</option>
                            <option value="UYO (ORON RD)"> UYO (ORON RD)</option>
                            <option value="UYO CENTRAL BIZ DISTRICT">UYO CENTRAL BIZ DISTRICT</option>
                            <option value="UYO-ABAK ROAD">UYO-ABAK ROAD</option>
                            <option value="VANDEIKYA">VANDEIKYA</option>
                            <option value="WARRI (AIRPORT ROAD)"> WARRI (AIRPORT ROAD)</option>
                            <option value="WARRI (IGBUDU MKT)"> WARRI (IGBUDU MKT)</option>
                            <option value="WARRI (PTI ROAD)"> WARRI (PTI ROAD)</option>
                            <option value="WARRI (SHELL)"> WARRI (SHELL)</option>
                            <option value="WARRI AIRPORT RD JUNCTION">WARRI AIRPORT RD JUNCTION</option>
                            <option value="WARRI MAIN">WARRI MAIN</option>
                            <option value="YANA">YANA</option>
                            <option value="YAURI">YAURI</option>
                            <option value="YENEGOA">YENEGOA</option>
                            <option value="YENOGOA II">YENOGOA II</option>
                            <option value="YOLA (BANK ROAD)"> YOLA (BANK ROAD)</option>
                            <option value="YOLA MAIN">YOLA MAIN</option>
                            <option value="YOLA MARKET">YOLA MARKET</option>
                            <option value="ZARIA">ZARIA</option>
                            <option value="ZARIA CITY">ZARIA CITY</option>
                            <option value="ZING">ZING</option>
                            <option value="ZUBA">ZUBA</option>
                            <option value="ZUBA II">ZUBA II</option>
                            <option value="ZURU">ZURU</option></select></div></div>

              

                    <br />


                    <div class="form-group required">
                        <label for="accountnumber">Bank Account Number</label>
                        <input class="form-control" id = "accountnumber" name="accountnumber"  placeholder="Bank Account Number" type="number" required="true">
                    </div>

                    <br />

                    <div class="form-group required">
                        <label for="accountname">Bank Account Name</label>
                        <input class="form-control" id = "accountname" name="accountname" maxlength="50" placeholder="Bank Account Name" type="text" required="true">
                    </div>

                    <br />

                    <div class="form-group required">
                        <label>Bank Account Currency</label>

                        <select class="form-control" id="accountcurrency" name="currency">
                            <option selected value="Nigerian NGN">Nigerian NGN</option>
                            <option value="America (United States) Dollars - USD">America (United States) Dollars – USD</option>
                            <option value="Afghanistan Afghanis - AFN">Afghanistan Afghanis – AFN</option>
                            <option value="Albania Leke - ALL">Albania Leke – ALL</option>
                            <option value="Algeria Dinars - DZD">Algeria Dinars – DZD</option>
                            <option value="Argentina Pesos - ARS">Argentina Pesos – ARS</option>
                            <option value="Australia Dollars - AUD">Australia Dollars – AUD</option>
                            <option value="Austria Schillings - ATS">Austria Schillings – ATS</OPTION>

                            <option value="Bahamas Dollars - BSD">Bahamas Dollars – BSD</option>
                            <option value="Bahrain Dinars - BHD">Bahrain Dinars – BHD</option>
                            <option value="Bangladesh Taka - BDT">Bangladesh Taka – BDT</option>
                            <option value="Barbados Dollars - BBD">Barbados Dollars – BBD</option>
                            <option value="Belgium Francs - BEF">Belgium Francs – BEF</OPTION>
                            <option value="Bermuda Dollars - BMD">Bermuda Dollars – BMD</option>

                            <option value="Brazil Reais - BRL">Brazil Reais – BRL</option>
                            <option value="Bulgaria Leva - BGN">Bulgaria Leva – BGN</option>
                            <option value="Canada Dollars - CAD">Canada Dollars – CAD</option>
                            <option value="CFA BCEAO Francs - XOF">CFA BCEAO Francs – XOF</option>
                            <option value="CFA BEAC Francs - XAF">CFA BEAC Francs – XAF</option>
                            <option value="Chile Pesos - CLP">Chile Pesos – CLP</option>

                            <option value="China Yuan Renminbi - CNY">China Yuan Renminbi – CNY</option>
                            <option value="RMB (China Yuan Renminbi) - CNY">RMB (China Yuan Renminbi) – CNY</option>
                            <option value="Colombia Pesos - COP">Colombia Pesos – COP</option>
                            <option value="CFP Francs - XPF">CFP Francs – XPF</option>
                            <option value="Costa Rica Colones - CRC">Costa Rica Colones – CRC</option>
                            <option value="Croatia Kuna - HRK">Croatia Kuna – HRK</option>

                            <option value="Cyprus Pounds - CYP">Cyprus Pounds – CYP</option>
                            <option value="Czech Republic Koruny - CZK">Czech Republic Koruny – CZK</option>
                            <option value="Denmark Kroner - DKK">Denmark Kroner – DKK</option>
                            <option value="Deutsche (Germany) Marks - DEM">Deutsche (Germany) Marks – DEM</OPTION>
                            <option value="Dominican Republic Pesos - DOP">Dominican Republic Pesos – DOP</option>
                            <option value="Dutch (Netherlands) Guilders - NLG">Dutch (Netherlands) Guilders – NLG</OPTION>

                            <option value="Eastern Caribbean Dollars - XCD">Eastern Caribbean Dollars – XCD</option>
                            <option value="Egypt Pounds - EGP">Egypt Pounds – EGP</option>
                            <option value="Estonia Krooni - EEK">Estonia Krooni – EEK</option>
                            <option value="Euro - EUR">Euro – EUR</option>
                            <option value="Fiji Dollars - FJD">Fiji Dollars – FJD</option>
                            <option value="Finland Markkaa - FIM">Finland Markkaa – FIM</OPTION>

                            <option value="France Francs - FRF*">France Francs – FRF*</OPTION>
                            <option value="Germany Deutsche Marks - DEM">Germany Deutsche Marks – DEM</OPTION>
                            <option value="Gold Ounces - XAU">Gold Ounces – XAU</option>
                            <option value="Greece Drachmae - GRD">Greece Drachmae – GRD</OPTION>
                            <option value="Guatemalan Quetzal - GTQ">Guatemalan Quetzal – GTQ</OPTION>
                            <option value="Holland (Netherlands) Guilders - NLG">Holland (Netherlands) Guilders – NLG</OPTION>
                            <option value="Hong Kong Dollars - HKD">Hong Kong Dollars – HKD</option>

                            <option value="Hungary Forint - HUF">Hungary Forint – HUF</option>
                            <option value="Iceland Kronur - ISK">Iceland Kronur – ISK</option>
                            <option value="IMF Special Drawing Right - XDR">IMF Special Drawing Right – XDR</option>
                            <option value="India Rupees - INR">India Rupees – INR</option>
                            <option value="Indonesia Rupiahs - IDR">Indonesia Rupiahs – IDR</option>
                            <option value="Iran Rials - IRR">Iran Rials – IRR</option>

                            <option value="Iraq Dinars - IQD">Iraq Dinars – IQD</option>
                            <option value="Ireland Pounds - IEP*">Ireland Pounds – IEP*</OPTION>
                            <option value="Israel New Shekels - ILS">Israel New Shekels – ILS</option>
                            <option value="Italy Lire - ITL*">Italy Lire – ITL*</OPTION>
                            <option value="Jamaica Dollars - JMD">Jamaica Dollars – JMD</option>
                            <option value="Japan Yen - JPY">Japan Yen – JPY</option>

                            <option value="Jordan Dinars - JOD">Jordan Dinars – JOD</option>
                            <option value="Kenya Shillings - KES">Kenya Shillings – KES</option>
                            <option value="Korea (South) Won - KRW">Korea (South) Won – KRW</option>
                            <option value="Kuwait Dinars - KWD">Kuwait Dinars – KWD</option>
                            <option value="Lebanon Pounds - LBP">Lebanon Pounds – LBP</option>
                            <option value="Luxembourg Francs - LUF">Luxembourg Francs – LUF</OPTION>

                            <option value="Malaysia Ringgits - MYR">Malaysia Ringgits – MYR</option>
                            <option value="Malta Liri - MTL">Malta Liri – MTL</option>
                            <option value="Mauritius Rupees - MUR">Mauritius Rupees – MUR</option>
                            <option value="Mexico Pesos - MXN">Mexico Pesos – MXN</option>
                            <option value="Morocco Dirhams - MAD">Morocco Dirhams – MAD</option>
                            <option value="Netherlands Guilders - NLG">Netherlands Guilders – NLG</OPTION>

                            <option value="New Zealand Dollars - NZD">New Zealand Dollars – NZD</option>
                            <option value="Norway Kroner - NOK">Norway Kroner – NOK</option>
                            <option value="Oman Rials - OMR">Oman Rials – OMR</option>
                            <option value="Pakistan Rupees - PKR">Pakistan Rupees – PKR</option>
                            <option value="Palladium Ounces - XPD">Palladium Ounces – XPD</option>
                            <option value="Peru Nuevos Soles - PEN">Peru Nuevos Soles – PEN</option>

                            <option value="Philippines Pesos - PHP">Philippines Pesos – PHP</option>
                            <option value="Platinum Ounces - XPT">Platinum Ounces – XPT</option>
                            <option value="Poland Zlotych - PLN">Poland Zlotych – PLN</option>
                            <option value="Portugal Escudos - PTE">Portugal Escudos – PTE</OPTION>
                            <option value="Qatar Riyals - QAR">Qatar Riyals – QAR</option>
                            <option value="Romania New Lei - RON">Romania New Lei – RON</option>

                            <option value="Romania Lei - ROL">Romania Lei – ROL</option>
                            <option value="Russia Rubles - RUB">Russia Rubles – RUB</option>
                            <option value="Saudi Arabia Riyals - SAR">Saudi Arabia Riyals – SAR</option>
                            <option value="Silver Ounces - XAG">Silver Ounces – XAG</option>
                            <option value="Singapore Dollars - SGD">Singapore Dollars – SGD</option>
                            <option value="Slovakia Koruny - SKK">Slovakia Koruny – SKK</option>

                            <option value="Slovenia Tolars - SIT">Slovenia Tolars – SIT</option>
                            <option value="South Africa Rand - ZAR">South Africa Rand – ZAR</option>
                            <option value="South Korea Won - KRW">South Korea Won – KRW</option>
                            <option value="Spain Pesetas - ESP">Spain Pesetas – ESP</OPTION>
                            <option value="Special Drawing Rights (IMF) - XDR">Special Drawing Rights (IMF) – XDR</option>
                            <option value="Sri Lanka Rupees - LKR">Sri Lanka Rupees – LKR</option>

                            <option value="Sudan Dinars - SDD">Sudan Dinars – SDD</option>
                            <option value="Sweden Kronor - SEK">Sweden Kronor – SEK</option>
                            <option value="Switzerland Francs - CHF">Switzerland Francs – CHF</option>
                            <option value="Taiwan New Dollars - TWD">Taiwan New Dollars – TWD</option>
                            <option value="Thailand Baht - THB">Thailand Baht – THB</option>
                            <option value="Trinidad and Tobago Dollars - TTD">Trinidad and Tobago Dollars – TTD</option>

                            <option value="Tunisia Dinars - TND">Tunisia Dinars – TND</option>
                            <option value="Turkey New Lira - TRY">Turkey New Lira – TRY</option>
                            <option value="United Arab Emirates Dirhams - AED">United Arab Emirates Dirhams – AED</option>
                            <option value="United Kingdom Pounds - GBP">United Kingdom Pounds – GBP</option>
                            <option value="United States Dollars - USD">United States Dollars – USD</option>
                            <option value="Venezuela Bolivares - VEB">Venezuela Bolivares – VEB</option>

                            <option value="Vietnam Dong - VND">Vietnam Dong – VND</option>
                            <option value="Zambia Kwacha - ZMK">Zambia Kwacha – ZMK</option>
                        </select>
                    </div>

                    <br />

                 

                       <div id="error4">
                      <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                         <strong>Danger! </strong>Please kindly remove special characters that are being sent or fill empty spaces left to be filled.
                      </div>
                    </div>

                    <button id="pre_btn2" class="btn btn-primary" onclick="prev_step1('third', 'fourth')" type="button">Previous</button>&emsp;
                    <button id="next_btn2" class="btn btn-primary" name="next" onclick="formValidate4()" type="button">Next</button> 
                </fieldset>


                <fieldset id="fifth">
                    <h2 class="title">Attachment</h2>
                    <p class="subtitle">Step 5</p>
                    <div class="form-group required">
                       
                        <label for="attachment">Attachment</label>
                        <input type="file" id="attachment" name="attachment" class="btn btn-default"><strong>Maximum file size 20MB</strong><br />
                        <p class="help-block" style="text-align: left; color: red">Kindly upload your Documents in a single PDF format.</p>
                    </div>
                    <br />

                    <button id="pre_btn2" class="btn btn-primary" onclick="prev_step1('fourth', 'fifth')" type="button">Previous</button> &emsp;

                    <button type="button" name="save" id="save" class="btn btn-primary" onclick="if (chk(event, this)){document.registrationform.submit(chk(event, this)); document.registrationform.reset();}">Submit</button>

                </fieldset>

               


            </form>


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
                        <li id="fb"><a href="http://www.firstbanknigeria.com/" target="_blank">Accessibility</a></li><br /><br />
                      

                    </ul>
                      <p style="color:white;float:left;font-weight: 100;">All technical and operational queries on this form should be directed to: <a href="mailto:vendorregistrationhelpdesk@firstbanknigeria.com">Supplier Care</a></p>.

                   

                        
 
                        </div>
                    </div>
               
           
            <script>
                $("#child_1").intlTelInput();
                $("#child_1_2").intlTelInput();
            </script>

        </footer>
    </body>
</html>

