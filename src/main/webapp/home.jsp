<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.Random" %>
<%@ page import="uz.pdp.jakarta_ee.db.DB" %>
<%@ page import="uz.pdp.jakarta_ee.entity.User" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>
    <%
        String email = request.getParameter("email");
        Optional<User> optionalUser = DB.users.stream().filter(user -> user.getEmail().equals(email)).findFirst();
        User user = new User();
        if (optionalUser.isPresent()){
            user = optionalUser.get();
        }
    %>


    <p>FirstName: <%= user.getFirstName() %></p>


</h1>
</body>
</html>