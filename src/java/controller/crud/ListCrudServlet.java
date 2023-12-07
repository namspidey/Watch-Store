/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.crud;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author namde
 */
@WebServlet(name="ListCrudServlet", urlPatterns={"/listcrud"})
public class ListCrudServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ListCrudServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCrudServlet at " + request.getContextPath () + "</h1>");
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
        String timer = request.getParameter("thongke");
        if(timer==null){
            timer="7";
        }
        int time = Integer.parseInt(timer);
        
        ProductDAO d = new ProductDAO();
        CategoryDAO cd= new CategoryDAO();
        List<Product> list= d.getAllProduct();
        List<Category> listC = cd.getAllCategory();
        
       
        
        int size = list.size();
            int page, numpage = 6;
            int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numpage;
            end = Math.min(page * numpage, size);
            List<Product> listt = d.getListByPage(list, start, end);
            
            
        
        Product bs = d.getProductBestSeller(time);
        request.setAttribute("productBS", bs);
        int numBS = d.getNumBS(time);
        request.setAttribute("numProductBS", numBS);
        
        int total = d.totalAmount(time);
        request.setAttribute("total", total);
        
        int numO = d.numOfOrder(time);
        request.setAttribute("numO", numO);
        
        int total1 = d.getNum1(30, 0);
        request.setAttribute("num1", total1);
        int total2 = d.getNum1(60, 30);
        request.setAttribute("num2", total2);
        int total3 = d.getNum1(90, 60);
        request.setAttribute("num3", total3);
        
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("listall", listt);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("crud.jsp").forward(request, response);
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

}
