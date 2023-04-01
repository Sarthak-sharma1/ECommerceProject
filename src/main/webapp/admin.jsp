<%@page import="java.util.Map"%>
<%@page import="com.learn.ecommerceproject.helper.helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerceproject.entities.Category"%>
<%@page import="com.learn.ecommerceproject.helper.FactoryProvider"%>
<%@page import="com.learn.ecommerceproject.dao.CategoryDao"%>
<%@page import="com.learn.ecommerceproject.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are Not Logged in !! Please Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "This is Admin Page Don't try to Access it");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%                               
    CategoryDao cat = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cat.getCategories();
    

//Getting Count
      Map<String,Long> m=  helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navBar.jsp" %>

        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

            <div class="row mt-3">

                <!-- first col -->
                <div class="col-md-4">
                    <!-- First Box -->
                    <div class="card" style="border: 1px solid #9575cd; cursor: pointer;">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="img/team.png" alt="users_icon"/>
                            </div>

                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>

                    </div>

                </div>

                <!-- second col -->
                <div class="col-md-4">
                    <!-- Second Box -->
                    <div class="card" style="border: 1px solid #9575cd; cursor: pointer;">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="img/list.png" alt="categories_icon"/>
                            </div>


                            <h1><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>

                    </div>
                </div>

                <!-- third col -->
                <div class="col-md-4">
                    <!-- Third Box -->
                    <div class="card" style="border: 1px solid #9575cd; cursor: pointer;" >
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="img/package.png" alt="products_icon"/>
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>

                    </div>
                </div>

            </div>

            <!-- Second Row -->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal" style="border: 1px solid #9575cd; cursor: pointer;">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="img/category.png" alt="categories_icon"/>
                            </div>


                            <p>Click here to add new Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" style="border: 1px solid #9575cd; cursor: pointer;"  data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="img/add-product.png" alt="categories_icon"/>
                            </div>


                            <p>Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>

                    </div>
                </div>

            </div>

        </div>

        <!-- Add Category Model -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-custom text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addCategory"/>

                            <div class="form-group">
                                <input type="text"  class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!-- End Category Model -->


        <!-- Add Product Model -->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addProduct"/>

                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" required placeholder="Enter Product Title"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pDescription" class="form-control" placeholder="Enter Product Description" style="height: 150px;"></textarea>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" required placeholder="Product ₨"/>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" required placeholder="Product Discount ₨"/>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" required placeholder="Product Quantity"/>
                            </div>



                            <div class="form-group">
                                <select id="" name="catId" class="form-control" >

                                    <%
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%}
                                    %>


                                </select>
                            </div>

                            <div class="form-group">
                                <label for="pPic">Product Picture</label>
                                <br>
                                <input type="file" name="pPic" id="pPic" required/>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>

        <!-- End Product Model -->
        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
