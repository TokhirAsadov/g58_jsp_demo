package uz.pdp.jakarta_ee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.jakarta_ee.entity.Book;
import uz.pdp.jakarta_ee.server.BookDAO;

import java.io.IOException;

@WebServlet(name = "BookServlet", value = "/books")
public class BookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Servlet ishladi...........");
        String id = req.getParameter("id");
        if (id!=null){
            Book book = BookDAO.findBookById(id);
            resp.sendRedirect("books.jsp?id="+id+"&name="+book.getName()+"&pages="+book.getPages());
            // BookDAO.findById(id)
        }
        else {
            boolean isAllBooksFetched = BookDAO.findAllBooks();
            if (isAllBooksFetched){
                resp.sendRedirect("books.jsp");
            } else {
                resp.sendRedirect("books_error.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Integer pages = Integer.valueOf(req.getParameter("pages"));
        boolean isSaved = BookDAO.createBook(name, pages);
        if (isSaved){
            System.out.println("saqlandi...");
            resp.sendRedirect("books.jsp");
        } else {
            resp.sendRedirect("books_error.jsp");
        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // BookDAO.deleteById(id)
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // BookDAO.updateById()
    }
}
