<%-- 
    Document   : add_dvd
    Created on : 26 May 2024, 7:35:31 pm
    Author     : U S E R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DVD Library Application: Add DVD Form</title>
    </head>
    <body>
        <h1>Add DVD (JSP)</h1>
        <form action='add_dvd.do' method='POST'>
            Title: <input type='text' name='title'><br><br>
            <%
                int curYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
            %>
            Year: <input type='text' name='year' value='<%=curYear%>'><br><br>
            Genre: <select name='genre'>
                <option value='Sci-Fi'>Sci-Fi</option>
                <option value='Drama'>Drama</option>
                <option value='Comedy'>Comedy</option>
            </select>
            or new genre: <input type='text' name='newGenre'><br><br>
            <input type='submit'>
        </form>
    </body>
</html>
