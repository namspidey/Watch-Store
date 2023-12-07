/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.User;

/**
 *
 * @author namde
 */
public class DAO extends DBContext {

    public User checkAccount(String username, String password) {
        String sql = "select * from [User] where username=? and pass=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getInt("role"), rs.getString("username"),
                        rs.getString("fullname"), rs.getString("email"), rs.getString("phone"), rs.getString("pass"),
                        rs.getString("address"), rs.getDate("birthday"));

            }
        } catch (SQLException e) {

        }

        return null;
    }

    public User getAccount(String username) {
        String sql = "select * from [User] where username=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getInt("role"), rs.getString("username"),
                        rs.getString("fullname"), rs.getString("email"), rs.getString("phone"), rs.getString("pass"),
                        rs.getString("address"), rs.getDate("birthday"));
            }
        } catch (SQLException e) {

        }

        return null;
    }

    public void signUp(String username, String fullname, String password, String phone, String address, String birth, String email) {
        String sql = "insert into [User]([username],[fullname],phone,pass,[address],[role],[birthday],[email])\n"
                + "values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setString(4, password);
            st.setString(5, address);
            st.setInt(6, 1);
            st.setString(7, birth);
            st.setString(8, email);

            st.executeQuery();
        } catch (SQLException e) {

        }
    }

    public User checkUserExist(String username) {
        String sql = "select * from [User] where username=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getInt("role"), rs.getString("username"),
                        rs.getString("fullname"), rs.getString("email"), rs.getString("phone"), rs.getString("pass"),
                        rs.getString("address"), rs.getDate("birthday"));

            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void changePass(User u, String newpass) {
        String sql = "UPDATE [dbo].[User]\n"
                + "set [pass] =?\n"
                + "WHERE [username]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, u.getUsername());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeProfile(User u, String newpass, String newphone, String newemail, String newaddress) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [email] = ?   \n"
                + "      ,[phone] = ?   \n"
                + "      ,[address] = ?     \n"
                + " WHERE [username]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newemail);
            st.setString(2, newphone);
            st.setString(3, newaddress);
            st.setString(4, u.getUsername());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<User> getAllAccount() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u= new User(rs.getInt("id"), rs.getInt("role"), rs.getString("username"),
                        rs.getString("fullname"), rs.getString("email"), rs.getString("phone"), rs.getString("pass"),
                        rs.getString("address"), rs.getDate("birthday"));
                list.add(u);
            }
        } catch (SQLException e) {

        }

        return list;
    } 

}
