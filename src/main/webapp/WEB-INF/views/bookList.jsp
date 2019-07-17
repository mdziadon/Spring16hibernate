<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <script>
        // function confirmDelete(id, title) {
        //     if (confirm("Do you want to delete a book \"" + title + "\"?")) {
        //         window.location.href = "/books/delete/" + id;
        //     }
        // }

        $(document).ready(function(){
            $('#deleteModal').on('show.bs.modal', function (event) {
                let bookId = $(event.relatedTarget).data('book-id');
                let bookTitle = $(event.relatedTarget).data('book-title');
                $(this).find('.modal-body p #bookTitle').text(bookTitle);

                $('#deleteId').on('click', function () {
                    window.location.href = "/books/delete/" + bookId;
                })
            });
        });

    </script>
    <title>Title</title>
</head>

<body>
<%@include file="/WEB-INF/views/header.jspf"%>

<div class="container">

    <header>Books</header>

    <div class="card">
        <div class="card-body">
            <a href="/books/add" class="btn btn-primary">Add book</a>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">

            <table class="table table-hover">
                <tr>
                    <th>Title</th>
                    <th>Rating</th>
                    <th>Publisher</th>
                    <th style="width: 15%">Actions</th>
                </tr>
                <c:forEach items="${books}" var="book">
                    <tr>
                        <td>${book.title}</td>
                        <td>${book.rating}</td>
                        <td>${book.publisher.name}</td>
                        <td>
                            <a href="/books/update/${book.id}" class="btn btn-success">Edit</a>
                            <a href="#" class="btn btn-danger"
                                    data-toggle="modal"
                                    data-target="#deleteModal"
                                    data-book-id="${book.id}"
                                    data-book-title="${book.title}"
                                    title="Delete book">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title">Potwierdzenie usunięcia</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <p>Czy na pewno usunąć książkę <strong><span id="bookTitle"></span></strong>?</p>
                        </div>

                        <div class="modal-footer">
                            <button id="deleteId" type="button" class="btn btn-primary">Confirm</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>

</html>
