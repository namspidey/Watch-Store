/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import model.User;

/**
 *
 * @author namde
 */
public class CategoryDAO extends DBContext {

    public List<Product> getProductByCategory(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where 1=1";
        if (cid != 0) {
            sql += " and category_id = " + cid;
        }
        sql += " order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product a = new Product(rs.getInt("id"), rs.getInt("price"), rs.getInt("category_id"),
                        rs.getInt("quantity"), rs.getString("name"), rs.getString("description"),
                        rs.getString("img"), rs.getString("brand"), rs.getDate("date"));
                list.add(a);
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addCategory(String name) {
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void updateCategory(String name, int id) {
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [name] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setInt(2, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Category where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                return c;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Category getCategoryByName(String name) {
        String sql = "select * from Category where [name] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                return c;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteCategory(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE category_id= ?\n"
                + "DELETE FROM [dbo].[Category]\n"
                + "      WHERE id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,id);
            st.setInt(2,id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CategoryDAO dd = new CategoryDAO();
        List<Category> listt = dd.getAllCategory();
        for (Category u : listt) {
            System.out.println(u.getName());
        }
        //em Tien
//        java.util.Date utilDate = new java.util.Date();
//        java.sql.Date date = new java.sql.Date(utilDate.getTime());
//        System.out.println(date);

    }
}
