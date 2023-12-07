/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.home;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author namde
 */
@WebServlet(name="HomeServlet", urlPatterns={"/home"})
public class HomeServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String idr=request.getParameter("id");
//        String brand=request.getParameter("brand");
        String search = request.getParameter("searchName");
        String to_raw = request.getParameter("pto");
        String from_raw = request.getParameter("pfrom");               
        String type_raw=request.getParameter("type");
        
        String[] brand = request.getParameterValues("brand");
        
        ProductDAO d = new ProductDAO();
        CategoryDAO dd = new CategoryDAO();       
        List<Product> listNew= d.getNewProduct();
        List<Product> listAll = d.getAllProduct();
        List<String> listBrand = d.getAllBrand();
        List<Category> listCate = dd.getAllCategory();
        List<Product> listBestSeller = d.getBestSeller();
        List<Product> products = new ArrayList<>();
        
        
        String path = request.getQueryString();
        if(idr!=null){
            int id=Integer.parseInt(idr);
            List<Product> listByCate = dd.getProductByCategory(id);
            
            int size = listByCate.size();
            int page, numpage = 8;
            int num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numpage;
            end = Math.min(page * numpage, size);
            List<Product> list = d.getListByPage(listByCate, start, end);
            request.setAttribute("list", list);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("id", id);
            
            if(path.contains("page")){
                String[] r = path.split("&");
                request.setAttribute("path", r[0]);
            }else{
                path=request.getQueryString();
                request.setAttribute("path", path);
            }
        }
        
        else if (brand!=null){           
            boolean[] chid = new boolean[listBrand.size() + 1];            
            products = d.searchByCheck(brand);
            if ((brand != null) && (brand[0] != null)) {
                chid[0] = false;
                for (int i = 1; i < chid.length; i++) {
                    if (ischeck(listBrand.get(i - 1), brand)) {
                        chid[i] = true;
                    } else {
                        chid[i] = false;
                    }
                }
             request.setAttribute("list", products);
             request.setAttribute("chid", chid);
            }
            
            if(brand[0].equals("0")){
                chid[0] = true;
                request.setAttribute("list", listAll);
            }
            
            
//            int size = listc.size();
//            int page, numpage = 8;
//            int num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
//            String xpage = request.getParameter("page");
//            if (xpage == null) {
//                page = 1;
//            } else {
//                page = Integer.parseInt(xpage);
//            }
//            int start, end;
//            start = (page - 1) * numpage;
//            end = Math.min(page * numpage, size);
//            List<Product> list = d.getListByPage(listc, start, end);
//            request.setAttribute("list", list);
//            request.setAttribute("page", page);
//            request.setAttribute("num", num);
//            request.setAttribute("brand1",brand );
            
             
            if(path.contains("page")){
                String[] r = path.split("&");
                request.setAttribute("path", r[0]);
            }else{
                path=request.getQueryString();
                request.setAttribute("path", path);
            }
        }
        
        else if(search!=null){
            List<Product> listByName = d.getProductByName(search);
            int size = listByName.size();
            int page, numpage = 8;
            int num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numpage;
            end = Math.min(page * numpage, size);
            List<Product> list = d.getListByPage(listByName, start, end);
            request.setAttribute("list", list);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("searchName", search);
            if(path.contains("page")){
                String[] r = path.split("&");
                request.setAttribute("path", r[0]);
            }else{
                path=request.getQueryString();
                request.setAttribute("path", path);
            }       
        }
        
        else if(from_raw!=null && to_raw!=null && type_raw!=null){
            int from = 0, to = Integer.MAX_VALUE;
                if (to_raw != null) {
                    try {
                        to = (Integer.parseInt(to_raw));
                    } catch (Exception e) {
                    }
                }
                if (from_raw != null) {
                    try {
                        from = (Integer.parseInt(from_raw));
                    } catch (Exception e) {
                    }
                }
            int type=Integer.parseInt(type_raw);
            List<Product> listPrice = d.getProductByPrice(from, to,type);
            int size = listPrice.size();
            int page, numpage = 8;
            int num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numpage;
            end = Math.min(page * numpage, size);
            List<Product> list = d.getListByPage(listPrice, start, end);
            String a = "MAX";
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("list", list);
            request.setAttribute("from", from);
            if(to==Integer.MAX_VALUE){
                request.setAttribute("to", a);
            }else{
            request.setAttribute("to", to);
            }
            if(path.contains("page")){
                String[] r = path.split("&(?=[^&]*$)");
                request.setAttribute("path", r[0]);
            }else{
                path=request.getQueryString();
                request.setAttribute("path", path);
            }
        } else{
            
            int size = listAll.size();
            int page, numpage = 8;
            int num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numpage;
            end = Math.min(page * numpage, size);
            List<Product> list = d.getListByPage(listAll, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("list", list);
            
        }
        
        
        
        request.setAttribute("listNew", listNew);
        request.setAttribute("listBS", listBestSeller);
        request.setAttribute("listBrand", listBrand);
        request.setAttribute("listCate", listCate);       
        request.setAttribute("listNew", listNew);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean ischeck(String d, String[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i].equals(d) ) {
                    return true;
                }
            }
            return false;
        }
    }

}
