/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Inventory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nqh14
 */
public class Search extends HttpServlet {
    private String priceLow;
    private String priceHigh;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Inventory> listproduct = new ArrayList<>();
        String txt = request.getParameter("txtSearch");
        if(request.getParameter("btnSearchPrice")!=null){
                stringHandle(txt);
                Inventory i = new Inventory();
                listproduct = i.searchByPr(priceLow, priceHigh);
        }

        
        request.setAttribute("lowPrice", priceLow);
        request.setAttribute("highPrice", priceHigh);
        request.setAttribute("listproductPr", listproduct);
        request.getRequestDispatcher("listProduct.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void stringHandle(String txt){
        for (int i = 0; i < txt.length(); i++) {
            if(String.valueOf(txt.charAt(i)).equals("-")){
                priceLow = txt.substring(0, i);
                priceHigh = txt.substring(i+1, txt.length());
            }
        }
        
    }
}
