<%-- 
    Document   : updateInformation
    Created on : Mar 9, 2024, 4:18:14 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi mật khẩu</title>
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>cs</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        <script type="text/javascript">
            function redirectToPage(c) {
                window.location.href = c;
            }
        </script>    
    </head>
    <body>
        <div id="content">
            <div id="contact" class="reqeste">
                <div class="container">
                    <div class="col-md-3" >
                            <button type="submit" class="send_account_btn" onclick="redirectToPage('home?user=${sessionScope.player.username}&page=1')" > Về trang chủ </button>
                        </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="titlepage">
                                <h2>Đổi mật khẩu</h2>
                                <span></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 offset-md-3">

                            <form id="cochang" class="form_main" action="pass?user=${sessionScope.player.username}" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        Mật khẩu cũ: <input class="form_control" type="password" name="oldPass">
                                    </div>
                                    <div class="col-md-12">
                                        Mật khẩu mới: <input class="form_control" type="password" name="newPass">
                                    </div>
                                    <div class="col-md-12">
                                        Nhập lại mật khẩu mới: <input class="form_control" type="password" name="newPass2">
                                    </div>
                                 
                                    <div class="col-md-12">

                                        <h3 style="color: red">${requestScope.noti}</h3>

                                        <button type="submit" class="send_btn">Xác nhận</button>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <footer>
                <div class="footer">
                    <div class="container">
                        <div class="row">

                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 text-center">

                                <div class="address">
                                    <h3>Liên hệ</h3>
                                    <ul class="Links_footer">
                                        <li>Trần Thanh Phong </li>
                                        <li>MSV: HE186430 </li>
                                        <li>SĐT: 0966232004 </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="copyright">
                        <div class="container">

                        </div>
                    </div>
                </div>
            </footer>
        </div>    
    </body>
</html>

