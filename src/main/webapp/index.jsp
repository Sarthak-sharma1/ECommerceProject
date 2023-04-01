<%@page import="com.learn.ecommerceproject.helper.helper"%>
<%@page import="com.learn.ecommerceproject.entities.Category"%>
<%@page import="com.learn.ecommerceproject.dao.CategoryDao"%>
<%@page import="com.learn.ecommerceproject.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerceproject.dao.ProductDao"%>
<%@page import="com.learn.ecommerceproject.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navBar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%                    String cat = request.getParameter("category");

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getProductByCategoryId(cid);
                    }

                    CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> catList = catDao.getCategories();

                %>
                <!-- Categories -->
                <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            Categories
                        </a>


                        <%                    for (Category c : catList) {
                        %>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>

                    </div>

                </div>





                <!-- Products -->
                <div class="col-md-10">
                    <div class="row mt-4">

                        <div class="col-md-12">

                            <div class="card-columns">

                                <!-- Traversing Products-->

                                <%
                                    for (Product p : list) {
                                %>

                                <div class="card">
                                    <div class="container text-center">
                                        <img src="img/products/<%=p.getpPhoto()%>" style="max-height: 200px;  max-width: 100%; width: auto;" alt="..." class="card-img-top "/>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%=helper.get10Words(p.getpDescription())%>
                                        </p>
                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn bg-custom text-white" onclick="add_to_cart(<%= p.getpPrice() %>,'<%= p.getpName() %>', <%=p.getPriceAfterApplyingDiscount() %> )">&#x1F6D2; Add To Cart</button>
                                        <button class="btn btn-outline-primary">&#8377; <%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary" style="font-size: 15px; font-style: italic; text-decoration: line-through;">&#8377; <%= p.getpPrice() %></span>  <span class="text-secondary discount-label" style="font-size: 15px; font-style: italic;">  (<%=p.getpDiscount() %> %off)</span></button>
                                    </div>

                                </div>

                                <%
                                    }
                                %>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
                                <%@include file="components/common_modal.jsp" %>
    </body>
</html>
