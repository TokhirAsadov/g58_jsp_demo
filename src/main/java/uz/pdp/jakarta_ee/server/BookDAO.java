package uz.pdp.jakarta_ee.server;

import uz.pdp.jakarta_ee.db.DB;
import uz.pdp.jakarta_ee.entity.Book;

import java.sql.*;

public class BookDAO {



    public static boolean findAllBooks(){
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/g58", "postgres", "123");
            PreparedStatement prps = connection.prepareStatement("select * from books;");

            ResultSet resultSet = prps.executeQuery();
            DB.books.clear();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int pages = resultSet.getInt("pages");
                DB.books.add(new Book(id, name, pages));
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean createBook(String name, Integer pages) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/g58", "postgres", "123");
            PreparedStatement prps = connection.prepareStatement("insert into books(name, pages) values (?, ?) returning id;");
            prps.setString(1, name);
            prps.setInt(2,pages);

            ResultSet resultSet = prps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                DB.books.add(new Book(id, name, pages));
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    // createBook

    // findById
    // deleteById
    // updateById
}
