package uz.pdp.jakarta_ee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Calculate", value = "/calc")
public class Calculate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter writer = resp.getWriter();
        writer.write("<h1>Calculation..</h1>");
        writer.write("""
                    <form method="post">
                       <label>A: <input type="number" name="a"></label>
                       <br>
                       <label>B: <input type="number" name="b"></label>
                       <br>
                       <label>Operation:
                           <select name="operation">
                               <option value="+">Add</option>
                               <option value="-">Sub</option>
                               <option value="*">Multiply</option>
                               <option value="/">Dev</option>
                           </select>
                       </label>
                       <br>
                       <button type="submit">Calculate</button>
                   </form>
                """);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer a = Integer.valueOf(req.getParameter("a"));
        Integer b = Integer.valueOf(req.getParameter("b"));
        String operation = req.getParameter("operation");
        System.out.println(a);
        System.out.println(b);
        System.out.println(operation);
        Long result = 0L;
        switch (operation) {
            case "+" -> result= (long) (a+b);
            case "-" -> result= (long) (a-b);
            case "*" -> result= (long) (a*b);
            case "/" -> result= (long) (a/b);
        }
        PrintWriter writer = resp.getWriter();
        writer.write("<h1>"+a+" "+operation+" "+b+" = "+result);
        writer.write("<br><a href=\"/calc\">Back To Calculation page</a>");
    }
}
