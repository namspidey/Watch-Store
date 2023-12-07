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
import model.Order;
import model.Product;

/**
 *
 * @author namde
 */
public class ProductDAO extends DBContext {

    public Product getProduct(int id) {
        Product p = new Product();
        String sql = "select * from Product where id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt("id"), rs.getInt("price"), rs.getInt("category_id"),
                        rs.getInt("quantity"), rs.getString("name"), rs.getString("description"),
                        rs.getString("img"), rs.getString("brand"), rs.getDate("date"));

            }

        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product ";
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

    public List<Product> getProductByName(String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
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

    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product order by id desc";
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

    public List<String> getAllBrand() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct p.brand from Product p";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String a = rs.getString("brand");
                list.add(a);
            }

        } catch (SQLException e) {
        }
        return list;

    }

    public void addProduct(String name, int cid, int price, String img, String des, String brand, int quantity) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([name]\n"
                + "           ,[description]\n"
                + "           ,[price]\n"
                + "           ,[img]\n"
                + "           ,[brand]\n"
                + "           ,[category_id]\n"
                + "           ,[quantity]\n"
                + "           ,[date])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date date = new java.sql.Date(utilDate.getTime());

            st.setString(1, name);
            st.setString(2, des);
            st.setInt(3, price);
            st.setString(4, img);
            st.setString(5, brand);
            st.setInt(6, cid);
            st.setInt(7, quantity);
            st.setDate(8, date);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product up) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[brand] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, up.getName());
            st.setString(2, up.getDes());
            st.setInt(3, up.getPrice());
            st.setString(4, up.getImg());
            st.setString(5, up.getBrand());
            st.setInt(6, up.getCid());
            st.setInt(7, up.getQuantity());
            st.setInt(8, up.getId());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductByPrice(int from, int to, int type) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where price between ? and ? order by price ";
        if (type == 0) {
            sql += "desc";
        } else {
            sql += "asc";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, from);
            st.setInt(2, to);

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

    public List<Product> getListSort(int type) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "order by price ";
        if (type == 0) {
            sql += "desc";
        } else {
            sql += "asc";
        }

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

    public List<Product> getProductByBrand(String brand) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where brand like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brand);

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

    public List<Product> getBestSeller() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 sum(o.quantity) as num,o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "from Orderdetail o ,Product p\n"
                + "where o.product_id=p.id\n"
                + "group by o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "order by num desc ";

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

    public Product getProductBestSeller(int time) {
        String sql = "select  sum(o.quantity) as num,o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "from Orderdetail o ,Product p,[Order] oo\n"
                + "where o.product_id=p.id  and oo.id=o.order_id and (datediff(d,oo.date,GETDATE()) <?)\n"
                + "group by o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "order by num desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, time);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product a = new Product(rs.getInt("id"), rs.getInt("price"), rs.getInt("category_id"),
                        rs.getInt("quantity"), rs.getString("name"), rs.getString("description"),
                        rs.getString("img"), rs.getString("brand"), rs.getDate("date"));
                return a;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public int getNumBS(int time) {
        int num = 0;
        String sql = "select  sum(o.quantity) as num,o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "from Orderdetail o ,Product p,[Order] oo\n"
                + "where o.product_id=p.id  and oo.id=o.order_id and (datediff(d,oo.date,GETDATE()) <?)\n"
                + "group by o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "order by num desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, time);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                num = rs.getInt("num");
                return num;
            }

        } catch (SQLException e) {
        }
        return 0;
    }
    
    public int getNum1(int time, int time2) {
        int num = 0;
        String sql = "select  sum(o.quantity) as num,o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "from Orderdetail o ,Product p,[Order] oo\n"
                + "where o.product_id=p.id  and oo.id=o.order_id and (datediff(d,oo.date,GETDATE()) <?) and (datediff(d,oo.date,GETDATE()) >?)\n"
                + "group by o.product_id,p.brand,p.category_id,p.date,p.description,p.id,p.img,p.name,p.price,p.quantity\n"
                + "order by num desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, time);
            st.setInt(2, time2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                num = rs.getInt("num");
                return num;
            }

        } catch (SQLException e) {
        }
        return 0;
    }

    public int totalAmount(int time) {
        String sql = "select sum(o.total_amount) as num from [Order] o\n"
                + "where (datediff(d,o.date,GETDATE()) < ?)";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, time);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getInt("num");
                return total;
            }

        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> searchByCheck(String[] brand) {

        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[img]\n"
                + "      ,[brand]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[date]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where 1=1 ";
        if (brand != null && brand[0] != null) {
            sql += " and brand in(";

            for (int i = 0; i < brand.length; i++) {
                sql +="'"+ brand[i]+"'" + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("price"), rs.getInt("category_id"),
                        rs.getInt("quantity"), rs.getString("name"), rs.getString("description"),
                        rs.getString("img"), rs.getString("brand"), rs.getDate("date"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
//    public Order(int id, int uid, int total, String name, String address, String phone, Date date) {
    public int numOfOrder(int time){
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] o where (datediff(d,o.date,GETDATE()) < ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, time);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order a = new Order(rs.getInt("id"),rs.getInt("user_id"),rs.getInt("total_amount"),rs.getString("username"),
                rs.getString("address"),rs.getString("phone"),rs.getDate("date"));
                list.add(a);
            }

        } catch (SQLException e) {
        }
        return list.size();
    }
    

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
        String[] l = {"Apple", "Casio"};
        List<Product> p = d.searchByCheck(l);
        System.out.println(p.get(0).getName());

    }
}
