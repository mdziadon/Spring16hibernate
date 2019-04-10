<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${propositions}" var="proposition">
        <tr>
            <td>${proposition.title}</td>
            <td>${proposition.description}</td>
            <td>
                <a href="/propostions/update/${proposition.id}">Edit</a>
                <a href="/propostions/delete/${proposition.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
