<%-- 
    Document   : withdraw
    Created on : Mar 10, 2024, 1:28:38 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rút tiền</title>
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
            
            function doDelete(id) {
                if (confirm("Bạn có chắc muốn xóa lịch rút chơi với ID = " + id)) {
                    window.location = "deletetran?id=" + id + "&user=${sessionScope.player.username}" + "&type=withdraw" +"#lsnr";
                }
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
                                <h2>Rút tiền</h2>
                                <span></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 offset-md-3">

                            <form id="cochang" class="form_main" action="withdraw?user=${sessionScope.player.username}" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        Số tiền rút về số tài khoản ${sessionScope.player.bankAccountNumber} ngân hàng ${sessionScope.player.bankName}:
                                        <input class="form_control" type="number" name="withdrawMoney">Đơn vị: $
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
            <div class="licens">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="lsnr" class="titlepage">
                                <h2>Lịch sử nạp rút</h2>
                                <span></span>
                            </div>
                        </div>
                        <div class="col-md-12">   
                            <table class="historyTable" border="1px">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nạp/Rút</th>
                                        <th>Số tiền</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${requestScope.data}" var="p">
                                    <tbody>
                                        <tr>
                                            <td>${p.ID}</td>
                                            <td>${p.typeString}</td>
                                            <td>${p.amount}</td>
                                            <td class="pagination"><a href="#" onclick="doDelete('${p.ID}')">Xóa</a></td>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                            </table> 
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