package uz.pdp.jakarta_ee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.jakarta_ee.db.DB;
import uz.pdp.jakarta_ee.entity.User;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Optional<User> optionalUser = DB.users.stream().filter(user -> user.getEmail().equals(email) && user.getPassword().equals(password)).findFirst();
        if (optionalUser.isPresent()) {
            System.out.println("🎉🎉🎉");
            User user = optionalUser.get();
            //todo--------------------------------
            resp.sendRedirect("success.jsp?email="+email);
        } else {
            resp.sendRedirect("error.jsp?email="+email+"&password="+password);
        }
    }
}
