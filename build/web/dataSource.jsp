<%-- 
    Document   : dataSource
    Created on : May 8, 2017, 10:52:05 AM
    Author     : TN041502
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

     <title>Vendor Information</title>

       <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->

    </head>  
    <%
    response.addHeader("X-FRAME-OPTIONS", "DENY");
%>
    <body>

  
      
          <sql:query dataSource="jdbc/SupplierCapture" var="result">
                SELECT id, suppliername, supplier_type_id, business_class_id, costcenter_id from vendorInformation where status='Not Confirmed';
            </sql:query>
                <sql:query dataSource="jdbc/SupplierCapture" var="result2">
                                SELECT * from branches order by costcenters ASC;
                            </sql:query>
                                 <sql:query dataSource="jdbc/SupplierCapture" var="result3">
                                SELECT * from businessClass;
                            </sql:query>
                                   <sql:query dataSource="jdbc/SupplierCapture" var="result4">
                                SELECT * from supplierType;
                            </sql:query>
    </body>
</html>