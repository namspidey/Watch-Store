/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.home;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author namde
 */
@WebServlet(name="SearchAjaxServlet", urlPatterns={"/searchAjax"})
public class SearchAjaxServlet extends HttpServlet {
   
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
        PrintWriter out = response.getWriter();
        String search = request.getParameter("searchName");
        ProductDAO d = new ProductDAO();
        List<Product> list = d.getProductByName(search);
        for(Product p : list){
            out.println("<div class=\"col-xl-3 col-lg-3 col-md-6 col-sm-6\">\n" +
"                        <div class=\"glasses_box\"  >\n" +
"                            <figure>\n" +
"                                <a href=\"single?id="+p.getId()+"&cid="+p.getCid()+"\">\n" +
" <!--                                   <img src=\""+p.getImg()+"\" alt=\"#\" style=\"width: 348px;height: 275px\" />-->\n" +
"                                    <img src=\""+p.getImg()+"\" alt=\"#\" style=\"text-align: center;\n" +
"                                 display: block ;\n" +
"                                 max-width: 348px;\n" +
"                                 max-height: 230px;\n" +
"                                 width: auto;\n" +
"                                 height: auto;\n" +
"                                 margin-left: auto;\n" +
"                                 margin-right: auto\" />\n" +
"                                </a>\n" +
"                            </figure>\n" +
"                            <h3> <fmt:formatNumber value=\""+p.getPrice()+"\" type=\"currency\" currencySymbol=\"\" minFractionDigits=\"0\"></fmt:formatNumber> <span class=\"blu\"> VNÐ</span></h3>\n" +
"                            <p>"+p.getName()+"</p>\n" +
"                        </div>\n" +
"                    </div>");
            
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
        processRequest(request, response);
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
