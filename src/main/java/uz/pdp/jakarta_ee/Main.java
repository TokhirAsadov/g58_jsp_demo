package uz.pdp.jakarta_ee;

import uz.pdp.jakarta_ee.entity.User;

import java.sql.*;

public class Main {
    public static void main(String[] args) throws SQLException {
        // 5432
        // g58
        // postgres
        // 123

        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/g58", "postgres", "123");

        updateData(connection);


        connection.close();
    }

    private static void updateData(Connection connection) throws SQLException {
        PreparedStatement prps = connection.prepareStatement("update users set first_name= ?, last_name=?, email=?, password=? where id = ?;");
        prps.setString(1, "Yangi_ism");
        prps.setString(2, "Yangi_familiya");
        prps.setString(3, "yangi_email");
        prps.setString(4, "yangi_p");
        prps.setInt(5, 1);

        prps.execute();
        System.out.println("✅✅✅✅");
    }

    private static void deleteById(Connection connection,Integer id) throws SQLException {
        PreparedStatement prps = connection.prepareStatement("delete from users where id=?;");
        prps.setInt(1,id);

        try {
            prps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void findById(Connection connection, Integer id) throws SQLException {
        PreparedStatement prps = connection.prepareStatement("select * from users where id=? ;");
        prps.setInt(1, id);
        ResultSet resultSet = prps.executeQuery();
        while (resultSet.next()) {
            String firstName = resultSet.getString("first_name");
            String lastName = resultSet.getString("last_name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");

            User user = new User(id, firstName, lastName, email, password);
            System.out.println(user);
        }
    }

    private static void findAll(Connection connection) throws SQLException {
        PreparedStatement prps = connection.prepareStatement("select * from users ;");
        ResultSet resultSet = prps.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String firstName = resultSet.getString("first_name");
            String lastName = resultSet.getString("last_name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");

            User user = new User(id, firstName, lastName, email, password);
            System.out.println(user);
        }
    }

    private static void saveMethod(Connection connection) throws SQLException {
        PreparedStatement prps = connection.prepareStatement("insert into users(first_name,last_name,email,password) values (?, ?, ?, ?)");
        prps.setString(1, "Eshmat");
        prps.setString(2, "Toshmatov");
        prps.setString(3, "eshmat123");
        prps.setString(4, "321");

        prps.execute();
//        prps.executeQuery();
        System.out.println("user is saved✅✅✅");
    }
}
