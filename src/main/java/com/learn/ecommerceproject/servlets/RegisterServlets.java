package com.learn.ecommerceproject.servlets;

import com.learn.ecommerceproject.entities.User;
import com.learn.ecommerceproject.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlets extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {

                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userMobile = request.getParameter("user_mobile");
                String userAddress = request.getParameter("user_address");

                if (userName.isEmpty()) {
                    out.println("UserName is Empty");
                    return;
                }

                User user = new User(userName, userEmail, userPassword, userMobile, "default.png", userAddress,"normal");

                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction trx = hibernateSession.beginTransaction();

              int userId = (int)  hibernateSession.save(user);
                
                trx.commit();
                hibernateSession.close();
   
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registeration Successfull  !! "+userId);
                response.sendRedirect("register.jsp");
                return;
            } catch (Exception e) {
                out.println("<h1>The Error is :" + e + "</h1>");
            }
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

}
