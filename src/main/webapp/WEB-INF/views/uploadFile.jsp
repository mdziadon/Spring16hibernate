<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <title>Title</title>
</head>
<body>

<%@include file="header.jspf" %>

<form:form method="POST" action="/files/uploadFile" enctype="multipart/form-data">

    <div class="container">

        <header>Upload file</header>

        <div class="card">
            <div class="card-body">
                <a href="/books/list" class="btn btn-primary">Back</a>
            </div>
        </div>

        <div class="card mt-4">

            <div class="card-header">
                Upload file
            </div>

            <div class="card-body">
                <table>
                    <tr>
                        <td><input type="file" name="file" id="file"/></td>
                    </tr>
                    <tr>
                        <td><button type="submit" class="btn btn-success"/>Save</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</form:form>

</body>
</html>
