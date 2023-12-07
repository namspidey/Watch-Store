/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author namde
 */
public class Product {
   
    private int id,price,cid,quantity;
    private String name,des,img,brand;
    private Date date;
    public Product() {
    }

    public Product(int id, int price, int cid, int quantity, String name, String des, String img, String brand) {
        this.id = id;
        this.price = price;
        this.cid = cid;
        this.quantity = quantity;
        this.name = name;
        this.des = des;
        this.img = img;
        this.brand = brand;
    }
    
    public Product(int id, int price, int cid, int quantity, String name, String des, String img, String brand, Date date) {
        this.id = id;
        this.price = price;
        this.cid = cid;
        this.quantity = quantity;
        this.name = name;
        this.des = des;
        this.img = img;
        this.brand = brand;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
   
    
}
