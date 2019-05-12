<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <script>
        function confirmDelete(id, name) {
            if (confirm("Do you want to delete a file \"" + name + "\"?")) {
                window.location.href = "/files/delete/" + id;
            }
        }
    </script>
    <title>Title</title>
</head>

<body>
<%@include file="/WEB-INF/views/header.jspf" %>

<div class="container">

    <header>Files</header>

    <div class="card">
        <div class="card-body">
            <form:form method="POST" action="/files/list" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td><input type="file" name="file" id="file"/></td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-primary mt-2">Add</button>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">

            <table class="table table-hover">
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th style="width: 210px">Actions</th>
                </tr>
                <c:forEach items="${files}" var="file">
                    <tr>
                        <td>${file.fileName}</td>
                        <td>${file.fileType}</td>
                        <td>
                            <a href="/files/download/${file.id}" class="btn btn-success">Download</a>
                            <a href="#" onclick="confirmDelete(${file.id}, '${file.fileName}')" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>

</html>
