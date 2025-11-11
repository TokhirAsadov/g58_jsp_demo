package uz.pdp.jakarta_ee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.jakarta_ee.db.DB;
import uz.pdp.jakarta_ee.entity.User;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");

        System.out.println(firstname);
        System.out.println(lastname);
        System.out.println(email);
        System.out.println(username);
        System.out.println(password);
        System.out.println(repassword);

        User user = User.builder()
                .id(UUID.randomUUID())
                .createdAt(new Date())
                .firstName(firstname)
                .lastName(lastname)
                .username(username)
                .email(email)
                .password(password)
                .build();
        DB.users.add(user);

        resp.sendRedirect("login.jsp");
    }
}
