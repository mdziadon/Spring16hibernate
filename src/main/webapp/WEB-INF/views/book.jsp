<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form:form method="post" modelAttribute="book">

    <div>
        <label>Title:
            <form:input path="title"/>
        </label>
    </div>
    <div>
        <label>Rating:
            <form:input type="number" path="rating"/>
        </label>
    </div>
    <div>
        <label>Description:
            <form:textarea path="description" cols="60" rows="3"/>
        </label>
    </div>
    <div>
        <label>Publisher:
            <form:select path="publisher.id" items="${publishers}" itemLabel="name" itemValue="id"/>
        </label>
    </div>

    <div>
        <label>Authors:
            <form:select path="authors" items="${authors}" itemLabel="fullName" itemValue="id"/>
        </label>
    </div>


    <input type="submit" value="Save">

</form:form>

</body>
</html>
