
<%
 User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are Not Logged in !! Please Login First To Access CheckOut Page thanks...");
        response.sendRedirect("login.jsp");
        return;
    }    

    %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navBar.jsp" %>

        <div class="container">
            <div class="row mt-5">

                <div class="col-md-6">
                    <!-- Cart  -->
                    <div class="card">

                        <div class="card-body">
                            <h3 class="text-center mb-4">Your Selected Items</h3>

                            <div class="cart-body">

                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-6">
                    <!-- Form User Details -->
                    <div class="card">
                        <div class="card-header">
                            User Delivery Address
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="name" class="form-label">Name</label>
                                    <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" name="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="form-label">Email</label>
                                    <input value= "<%=user.getUserEmail() %>" type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <textarea value="<%= user.getUserAddress() %>" class="form-control" id="address" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="mobileNumber" class="form-label">Phone Number</label>
                                    <input value="<%= user.getUserhone() %>" type="number" class="form-control" id="mobileNumber" name="number" required>
                                </div>

                                <div class="container text-center">
                                      <button type="submit" class="btn btn-outline-success">Order now</button>
                                      <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                              
                            </form>
                        </div>
                    </div>


                </div>

            </div>
        </div>


        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
