/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author namde
 */
public class CartDAO extends DBContext {

    public void addOrder(User c, Cart cart, String name, String phone, String address) {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date date = new java.sql.Date(utilDate.getTime());
        try {
            //add order
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([total_amount]\n"
                    + "           ,[username]\n"
                    + "           ,[address]\n"
                    + "           ,[phone]\n"
                    + "           ,[date]\n"
                    + "           ,[user_id])\n"
                    + "     VALUES (?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cart.getTotalMoney());
            st.setString(3, address);
            st.setString(4, phone);
            st.setDate(5, date);
            st.setInt(6, c.getId());
            st.setString(2, name);
            st.executeUpdate();
            //lay id cua order vua add
            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[Orderdetail]\n"
                            + "           ([order_id]\n"
                            + "           ,[product_id]\n"
                            + "           ,[product_name]\n"
                            + "           ,[product_img]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setString(3, i.getProduct().getName());
                    st2.setString(4, i.getProduct().getImg());
                    st2.setInt(5, i.getQuantity());
                    st2.setInt(6, i.getPrice());
                    
                    st2.executeUpdate();
                }
            }
            //cap nhat lai so luong san pham
            String sql3 = "update [Product] set quantity=quantity-? where id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {

        }
    }
}
