<%-- 
    Document   : register
    Created on : Mar 22, 2023, 8:16:21 PM
    Author     : Sarthak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navBar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">

                <div class="col-md-6 offset-md-3">

                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        
                        <div class="card-body px-5">

                            <div class="container text-center">

                                <img src="img/usersignup.png" style="max-width: 100px;"class="img-fluid" alt="User Sign Up" >

                            </div>

                            <h3 class="text-center my-3">Sign Up Form</h3>
                            <form action="RegisterServlets" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name"  aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email"  type="email" class="form-control" id="email"  aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password"  aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="number">User Mobile</label>
                                    <input name="user_mobile" type="number" class="form-control" id="number"  aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea name="user_address" class="form-control" placeplaceholder="Enter your Address" style="height: 100px;" ></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Submit</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>

                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
