/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dvd.controller;

import com.dvd.model.DVDItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author U S E R
 */
public class AddDVDServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddDVDServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDVDServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //processRequest(request, response);
        List errorMsgs = new LinkedList();
        
        try{
            //Retrieve form parameters
            String title = request.getParameter("title");
            String year = request.getParameter("year");
            //Did the user type in a genre?
            String genre = request.getParameter("newGenre");
            //If not, use the drop-down list value
            if( (genre == null) || (genre.trim().length()==0) ){
                genre = request.getParameter("genre");
            }
            
            //Form verification
            if (title == null || title.trim().length() == 0){
                errorMsgs.add("Please enter the DVD title.");
            }
            if(year == null || year.trim().length() == 0){
                errorMsgs.add("Please enter the year of release for the DVD.");
            }
            else if (!year.trim().matches("\\d\\d\\d\\d")){
                errorMsgs.add("Please enter a valid year.");
            }
            if(!errorMsgs.isEmpty()){
                request.setAttribute("errorMsgs",errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/errorJSTL.jsp");
                view.forward(request,response);
                return;
            }
            
            //Business logic
            DVDItem item = new DVDItem(title,year,genre);
            
            //Store the item on the request-scope
            request.setAttribute("dvdItem",item);
             
            //Dispatch to Success view
            RequestDispatcher view = request.getRequestDispatcher("/successJSTL.jsp");
            view.forward(request,response);
            
            //Handle any unexpected expections
        }
        catch (RuntimeException e){
            errorMsgs.add("An unexpected erorr: " + e.getMessage());
            request.setAttribute("errorMsgs",errorMsgs);
            RequestDispatcher view = request.getRequestDispatcher("/errorJSTL.jsp");
            view.forward(request, response);
        }
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

}
