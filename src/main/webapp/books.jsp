<%@ page import="uz.pdp.jakarta_ee.db.DB" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.jakarta_ee.entity.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" href="/css/books.css">
</head>
<body>

<div class="container">
    <h1>Book Management System</h1>

    <div id="notification" class="notification hidden"></div>

    <div class="book-form">
        <h2 id="form-title">Add New Book</h2>
        <form id="bookForm" action="/books" method="post">
            <input type="hidden" id="bookId">
            <div class="form-group">
                <label for="bookName">Book Name</label>
                <input type="text" id="bookName" name="name" required>
            </div>
            <div class="form-group">
                <label for="bookPages">Pages</label>
                <input type="number" id="bookPages" name="pages" required>
            </div>
            <div class="form-group">
                <button type="submit" id="submitBtn" class="btn-success">Add Book</button>
            </div>
        </form>
    </div>

    <table class="book-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Pages</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="bookTableBody">
        <%
            List<Book> books = DB.books;
            for(int i=0; i< books.size(); i++){
                out.println("<tr><td>"+books.get(i).getId()+"</td>\n" +
                        "                        <td>"+books.get(i).getName()+"</td>\n" +
                        "                        <td>"+books.get(i).getPages()+"</td>\n" +
                        "                        <td>\n" +
                        "                            <div class=\"action-buttons\">\n" +
                        "                                <button class=\"btn-success\" onclick=\"bookManager.editBook("+books.get(i).getId()+")\">Edit</button>\n" +
                        "                                <button class=\"btn-danger\" onclick=\"bookManager.deleteBook("+books.get(i).getId()+")\">Delete</button>\n" +
                        "                            </div>\n" +
                        "                        </td></tr>");
            }
        %>
        </tbody>
    </table>
</div>


</body>
</html>
