<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>

<form:form method="post" modelAttribute="user">

    <div class="container">

        <header>Add user</header>

        <div class="card">
            <div class="card-body">

                <div class="form-group">
                    <label for="usernameId">Username:</label>
                    <form:input type="text" path="username" id="usernameId" class="form-control"/>
                    <form:errors path="username" element="div" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="passwordId">Password:</label>
                    <form:input type="password" path="password" id="passwordId" class="form-control"/>
                    <form:errors path="password" element="div" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="emailId">Email:</label>
                    <form:input type="text" path="email" id="emailId" class="form-control"/>
                    <form:errors path="email" element="div" cssClass="error"/>
                </div>

                <input type="submit" value="Save" class="btn btn-primary">

            </div>
        </div>

    </div>

</form:form>
</body>
</html>
