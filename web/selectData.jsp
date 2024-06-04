<%-- 
    Document   : selectData
    Created on : Jun 1, 2024, 11:34:54 AM
    Author     : U S E R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/dvdlibrary" user="root"
                   password="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Data (JSP)</title>
    </head>
    <body>
        <c:set var="id" value="${param.id}"/>
        <c:set var="username" value="${param.username}"/>
        <c:set var="title" value="${param.title}"/>
        <c:set var="year" value="${param.year}"/>
        <c:set var="genre" value="${param.genre}"/>
        
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM ITEM
        </sql:query>
    
        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
