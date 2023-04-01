/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.ecommerceproject.servlets;

import com.learn.ecommerceproject.dao.CategoryDao;
import com.learn.ecommerceproject.dao.ProductDao;
import com.learn.ecommerceproject.entities.Category;
import com.learn.ecommerceproject.entities.Product;
import com.learn.ecommerceproject.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String op = request.getParameter("operation");
            if (op.trim().equals("addCategory")) {
                // add Category Details
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                // Saving Of Category to Database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategoryDetails(category);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Added Successfully : " + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addProduct")) {
                // add Product Details
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDescription");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catd = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product pro = new Product();
                pro.setpName(pName);
                pro.setpDescription(pDesc);
                pro.setpPrice(pPrice);
                pro.setpDiscount(pDiscount);
                pro.setpQuantity(pQuantity);
                pro.setpPhoto(part.getSubmittedFileName());

                //get Category By Id
                CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());
                Category category = dao.getCategoryById(catd);

                pro.setCategory(category);

                // Save Product
                ProductDao pd = new ProductDao(FactoryProvider.getFactory());
                pd.saveProduct(pro);

                //photo Upload
                String path = request.getRealPath("img" + File.separator + "products" + File.separator + part.getSubmittedFileName());
                System.out.println(path);

                try {
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos
                            .write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
//                out.println("<h1>Product Saved Successfully...</h1>");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product Saved Successfully and Category id is :" + catd);
                response.sendRedirect("admin.jsp");
                return;
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
