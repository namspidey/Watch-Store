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
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author namde
 */
@WebServlet(name="PriceServlet", urlPatterns={"/price"})
public class PriceServlet extends HttpServlet {
   
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
            out.println("<title>Servlet PriceServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PriceServlet at " + request.getContextPath () + "</h1>");
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
        String to_raw = request.getParameter("pto");
        String from_raw = request.getParameter("pfrom"); 
        String type_raw=request.getParameter("type");
        int from=0,to=Integer.MAX_VALUE;
            if(to_raw!=null){
                try {
                    to = (Integer.parseInt(to_raw));
                } catch (Exception e) {
                }
                
            }
            if(from_raw!=null){
               try {
                    from = (Integer.parseInt(from_raw));
                } catch (Exception e) {
                }
            }
            ProductDAO d = new ProductDAO();
            
            int type=Integer.parseInt(type_raw);
            List<Product> list = d.getProductByPrice(from, to,type);            
            int size = list.size();
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
            List<Product> list1 = d.getListByPage(list, start, end);
            
            CategoryDAO dd = new CategoryDAO();
            List<Category> listt = dd.getAllCategory();
            List<String> listB = d.getAllBrand();
            List<Product> listNew= d.getNewProduct();
            
            request.setAttribute("listB", listB);
            request.setAttribute("listCate", listt);
            request.setAttribute("from", from);
            request.setAttribute("to", to);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("list1", list1);
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

}
