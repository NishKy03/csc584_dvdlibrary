<%-- 
    Document   : error
    Created on : 26 May 2024, 7:46:50 pm
    Author     : U S E R
--%>

<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String genre_list = "Sci-Fi,Drama,Comedy";
    String [] genres = null;
    genres = genre_list.split(",");
    request.setAttribute("genredata",genres);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DVD Library Application: Add DVD Error</title>
    </head>
    <body>
        <h1>Add DVD Error (JSTL)</h1>
        <%
            List errorMsgs = (List)request.getAttribute("errorMsgs");
        %>
        <c:if test="${not empty errorMsgs}">
            <br>
            <font color='red'>
                Please correct the following errors:
                <ul>
                    <c:forEach var="message" items="${errorMsgs}">
                        <li>${message}</li>
                    </c:forEach>
                </ul>
            </font>
        </c:if>
        <br>
        <form action='add_dvd.do' method='POST'>
            Title: <input type='text' name='title' value='${param.title}'><br><br>
            Year: <input type='text' name='year' value='${param.year}'><br><br>

            <% String genre = request.getParameter("genre");%>
            Genre: <select name='genre'>
            <c:forEach var="genre_item" items="${genredata}">
                <option value='${genre_item}'
                <c:if test="${genre_item eq param.genre}">selected</c:if>
                >${genre_item}</option>
            </c:forEach>
            </select>
            or new genre: <input type='text' name='newGenre' value='${param.newGenre}'><br><br>
            <input type='submit' value='submit'>
        </form>
    </body>
</html>
