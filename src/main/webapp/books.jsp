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
        <h2 id="form-title">
            <%
                String id = request.getParameter("id");
                out.println(id==null ? "Add New Book" : "Update Book");
            %>
        </h2>
        <form id="bookForm" action="/books" method="post">
            <% if (id!=null) {
                out.println("<input type=\"hidden\" id=\"bookId\" name=\"id\" value=\""+id+"\" >");
            }%>

            <div class="form-group">
                <%
                    if (id!=null){
                        String name = request.getParameter("name");
                        out.println("<label for=\"bookName\">Book Name</label><input type=\"text\" id=\"bookName\" name=\"name\" value="+name+" required>");
                    } else {
                        out.println("<label for=\"bookName\">Book Name</label><input type=\"text\" id=\"bookName\" name=\"name\" required>");
                    }
                %>

            </div>
            <div class="form-group">
                <%
                    if (id!=null){
                        Integer pages = Integer.valueOf(request.getParameter("pages"));
                        out.println("<label for=\"bookPages\">Pages</label><input type=\"text\" id=\"bookPages\" name=\"pages\" value="+pages+" required>");
                    } else {
                        out.println("<label for=\"bookPages\">Pages</label><input type=\"text\" id=\"bookPages\" name=\"pages\" required>");
                    }
                %>
            </div>
            <div class="form-group">
                <button type="submit" id="submitBtn" class="btn-success">
                    <%  out.println(id!=null ? "Update " : "Add "); %>
                    Book</button>
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
                        "                                <a class=\"btn-success\" href=\"/books?id="+books.get(i).getId()+"\">Edit</button>\n" +
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
