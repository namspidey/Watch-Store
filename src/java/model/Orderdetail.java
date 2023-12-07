/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author namde
 */
public class Orderdetail {
    
     private int id,oid,pid,price,quantity;
     private String name,img;

    public Orderdetail() {
    }

    public Orderdetail(int id, int oid, int pid, int price, int quantity, String name, String img) {
        this.id = id;
        this.oid = oid;
        this.pid = pid;
        this.price = price;
        this.quantity = quantity;
        this.name = name;
        this.img = img;
    }

//    public Orderdetail(int id, int oid, int pid, int price, String name, String img) {
//        this.id = id;
//        this.oid = oid;
//        this.pid = pid;
//        this.price = price;
//        this.name = name;
//        this.img = img;
//    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
     
}
