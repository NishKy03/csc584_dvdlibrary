<%-- 
    Document   : success
    Created on : 26 May 2024, 6:49:18 pm
    Author     : U S E R
--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dvdItem" scope="request" type="com.dvd.model.DVDItem"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DVD Library Application: Add DVD Success</title>
    </head>
    <body>
        <h1>Add DVD Success(JSTL)</h1>
        You have add the following DVD: <br>
        Title: ${dvdItem.title}<br>
        Year Release: ${dvdItem.year}<br>
        Genre of film: ${dvdItem.genre}<br>
        <br><a href='index.html'>Home</a> 
    </body>
</html>
