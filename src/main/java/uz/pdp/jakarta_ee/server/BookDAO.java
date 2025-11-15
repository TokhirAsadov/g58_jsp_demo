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

    public static Book findBookById(String id) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/g58", "postgres", "123");
            PreparedStatement prps = connection.prepareStatement("select name, pages from books where id=?;");
            prps.setInt(1, Integer.parseInt(id));

            ResultSet resultSet = prps.executeQuery();
            Book book = null;
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int pages = resultSet.getInt("pages");
                book = new Book(Integer.valueOf(id), name, pages);
            }
            return book;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean updateBook(String id, String name, Integer pages) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/g58", "postgres", "123");
            PreparedStatement prps = connection.prepareStatement("update books set name=?, pages=? where id=?;");
            prps.setString(1, name);
            prps.setInt(2,pages);
            prps.setInt(3, Integer.parseInt(id));

            prps.execute();
            Book book1 = DB.books.stream().filter(book -> book.getId().equals(Integer.valueOf(id))).findFirst().get();
            book1.setName(name);
            book1.setPages(pages);

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
