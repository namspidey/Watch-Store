/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Orderdetail;
import model.Product;

/**
 *
 * @author namde
 */
public class OrderDAO extends DBContext {
    public List<Order> getAllOrder(){
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order a = new Order(rs.getInt("id"), rs.getInt("user_id"), rs.getInt("total_amount"),
                        rs.getString("username"), rs.getString("address"), rs.getString("phone"), rs.getDate("date"));
                list.add(a);
            }

        } catch (SQLException e) {
        }
        return list;
        
    }
    
    public List<Orderdetail> getOrderDetailById(int oid){
        List<Orderdetail> list = new ArrayList<>();
        String sql = "select * from Orderdetail where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //public Orderdetail(int id, int oid, int pid, int price, String name, String img) {
                Orderdetail a = new Orderdetail(rs.getInt("id"),rs.getInt("order_id"),
                        rs.getInt("product_id"),rs.getInt("price"),rs.getInt("quantity"),rs.getString("product_name"),
                        rs.getString("product_img"));
                list.add(a);
            }

        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Order> getOrderById(int uid){
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where [user_id]= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //public Orderdetail(int id, int oid, int pid, int price, String name, String img) {
                Order a = new Order(rs.getInt("id"), rs.getInt("user_id"), rs.getInt("total_amount"),
                        rs.getString("username"), rs.getString("address"), rs.getString("phone"), rs.getDate("date"));
                list.add(a);
            }

        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        OrderDAO d = new OrderDAO();
        List<Order> listo = d.getAllOrder();
        for(Order o: listo){
            System.out.println(o.getTotal());
        }
        
    }
}
