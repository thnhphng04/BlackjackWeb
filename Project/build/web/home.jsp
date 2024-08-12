<%-- 
    Document   : Home
    Created on : Mar 4, 2024, 9:24:34 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Trang chủ</title>
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
            function doDelete(id){
            if (confirm("Bạn có chắc muốn xóa lịch sử chơi với ID = " + id)){
            window.location = "delete?id=" + id + "&user=${sessionScope.player.username}" + "&page=${requestScope.pageActive}";
            }
            }
        </script>
    </head>
    <!-- body -->
    <body class="main-layout">


        <!-- end loader -->

        <div id="content">
            <!-- header -->
            <header>
                <!-- header inner -->
                <div class="head_top">
                    <div class="header" style="background-color: black; height: 15%">
                        <div class="container-fluid">
                            <div class="row">

                                <div class="col-md-1 logo_section">
                                    <div class="full">
                                        <div class="center-desk">
                                            <div class="logo">
                                                <a href="home"><img src="images/logo.png" alt="#"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2 logo_section">
                                    <div class="full">
                                        <div class="center-desk">
                                            <div class="logo" style="color: yellow">
                                                <a href="account?user=${sessionScope.player.username}"><img src="images/user_icon.png" alt="#" width="15%" height="15%">Tài khoản</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 logo_section">
                                    <div class="full">
                                        <div class="center-desk">
                                            <div class="titlepage">
                                                <c:if test="${sessionScope.player!=null}">
                                                    <h2>Số dư: ${sessionScope.player.balance} $</h2>
                                                </c:if>  
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="right_header_info">
                                        <ul>
                                            <li class="menu_iconb">
                                                <a href="deposit?user=${sessionScope.player.username}">Nạp</a>
                                            </li>
                                            <li class="menu_iconb">
                                                <a href="withdraw?user=${sessionScope.player.username}">Rút</a>
                                            </li>
                                            <li class="menu_iconb">
                                                <c:if test="${sessionScope.player==null}">
                                                    <a href="login">Đăng nhập</a>
                                                </c:if>
                                                <c:if test="${sessionScope.player!=null}">
                                                    <a href="logout">Đăng xuất</a>
                                                </c:if>    

                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- end header inner -->
            <!-- end header -->
            <section class="slider_section">
                <div class="banner_main">
                    <img src="images/background.webp" alt="#"/>
                    <div class="container-fluid padding3">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="text-bg">
                                    <a href="blackjack?user=${sessionScope.player.username}">Play now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Categories -->
            <!-- casino -->



            <!-- end casino -->
            <!-- licens -->
            <div class="licens">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="lsc" class="titlepage">
                                <h2>Lịch sử chơi</h2>
                                <span></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <c:set var="page" value="${requestScope.page}"/>
                            <div class="pagination">
                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                    <a class="${i==(requestScope.pageActive)?"active":""}" href="home?user=${sessionScope.player.username}&page=${i}#lsc" style="color:yellow">${i}</a> 
                                </c:forEach>
                            </div> 
                            <table class="historyTable" border="1px">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Game</th>
                                        <th>Chi tiết</th>
                                        <th>Tiền đặt cược</th>
                                        <th>Tiền nhận về</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${requestScope.data}" var="p">
                                    <tbody>
                                        <tr>
                                            <td>${p.ID}</td>
                                            <td>${p.game}</td>
                                            <td>${p.detail}</td>
                                            <td>${p.betMoney}</td>
                                            <td>${p.collectedMoney}</td>
                                            <td class="pagination"><a onclick="doDelete('${p.ID}')">Xóa</a></td>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                            </table> 
                        </div>
                    </div>
                </div>
                <!-- end lLicens -->
                <!-- customer -->
                <div id="customer"  class="customer">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="titlepage">
                                    <h2>Giới thiệu</h2>
                                    <span></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10 offset-md-1">
                                <div class="customer_text">
                                    <p>Đây là trang web chơi Blackjack miễn phí để người chơi luyện tập kỹ năng và trải nghiệm cảm giác của việc đặt cược và giành chiến thắng.<br>Trang web cung cấp một số tính năng như tạo tài khoản, đăng nhập, sửa thông tin tài khoản, nạp rút giả lập.</p>
                                    <div class="customer_box">
                                        <i><img src="images/face2.png" alt="#"/></i>
                                        <h4>Trần Thanh Phong</h4>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end customer -->

                <!--  footer -->

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
                </div>
                <div class="copyright">
                    <div class="container">

                    </div>
                </div>
            </div>

            <!-- end footer -->
        </div>
        <div class="overlay"></div>
        <!-- Javascript files-->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <!-- sidebar -->
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
        <script src="js/custom.js"></script>

        <script>
                                                    $(document).ready(function () {
                                                    $(".fancybox").fancybox({
                                                    openEffect: "none",
                                                            closeEffect: "none"
                                                    });
                                                    $(".zoom").hover(function () {

                                                    $(this).addClass('transition');
                                                    }, function () {

                                                    $(this).removeClass('transition');
                                                    }
                                                    );
                                                    });
        </script>
        <script src="blackjack/script.js></script>

                </body>
                </html>


