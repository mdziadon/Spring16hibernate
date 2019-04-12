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

<form:form method="post" modelAttribute="book">

    <div class="container">

        <header>Add book</header>

        <div class="card">
            <div class="card-body">
                <a href="/books/list" class="btn btn-primary">Back</a>
            </div>
        </div>

        <div class="card mt-4">

            <div class="card-header">
                Book data
            </div>

            <div class="card-body">

                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="titleId">Title:</label>
                        <form:input path="title" class="form-control" id="titleId"/>
                        <form:errors path="title" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="ratingId">Rating:</label>
                        <form:input type="number" path="rating" min="1" max="10" class="form-control" id="ratingId"/>
                        <form:errors path="rating" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="pagesId">Pages:</label>
                        <form:input type="number" path="pages" class="form-control" id="pagesId"/>
                        <form:errors path="pages" element="div" cssClass="error"/>
                    </div>

                </div>

                <div class="form-group">
                    <label for="publisherId">Publisher:</label>
                    <form:select path="publisher.id" items="${publishers}" itemLabel="name" itemValue="id"
                                 class="form-control" id="publisherId"/>
                    <form:errors path="publisher.id" element="div" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="authorsId">Authors:</label>
                    <form:select path="authors" items="${authors}" itemLabel="fullName" itemValue="id"
                                 class="form-control" id="authorsId"/>
                    <form:errors path="authors" element="div" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="descriptionId">Description:</label>
                    <form:textarea path="description" cols="60" rows="3" class="form-control" id="descriptionId"/>
                    <form:errors path="description" element="div" cssClass="error"/>
                </div>

                <input type="submit" value="Save">

            </div>


        </div>

    </div>

</form:form>

</body>
</html>
