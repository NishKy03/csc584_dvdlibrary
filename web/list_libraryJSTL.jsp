<%-- 
    Document   : list_library
    Created on : 26 May 2024, 8:09:16 pm
    Author     : U S E R
--%>

<%@page import="java.util.List,java.util.ArrayList,com.dvd.model.DVDItem"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<DVDItem> dvds = new ArrayList();
    dvds.add(new DVDItem("Aquaman","2019","Sci-Fi"));
    dvds.add(new DVDItem("Robin Hood","2018","Action"));
    dvds.add(new DVDItem("The Grinch","2018","Comedy"));
    request.setAttribute("itemdata",dvds);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Library (JSTL)</title>
    </head>
    <body bgcolor='white'>
        You currently have <b>${fn:length(itemdata)}</b> DVDs in your collection:<br>
        <table border='0' cellspacing='0' cellpadding='5'>
            <tr>
                <th>TITLE</th>
                <th>YEAR</th>
                <th>GENRE</th>
            </tr>
            <c:forEach items="${itemdata}" var="item">
            <tr>
                <td>${item.title}</td>
                <td>${item.year}</td>
                <td>${item.genre}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
