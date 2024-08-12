/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PlayerDAO;
import dal.TransactionHistoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Player;
import model.TransactionHistory;

/**
 *
 * @author DELL
 */
@WebServlet(name = "DepositServlet", urlPatterns = {"/deposit"})
public class DepositServlet extends HttpServlet {

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
            out.println("<title>Servlet DepositServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DepositServlet at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("user");
        
        TransactionHistoryDAO thd = new TransactionHistoryDAO(); 
        
        ArrayList<TransactionHistory> list = thd.getListOfPlayHistoryByUsername(username);
        
        request.setAttribute("data", list);
        
        request.getRequestDispatcher("deposit.jsp").forward(request, response);
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
        String username = request.getParameter("user");

        String depositMoney_raw = request.getParameter("depositMoney");

        Double depositMoney = Double.parseDouble(depositMoney_raw);

        if (depositMoney > 0) {
            PlayerDAO pd = new PlayerDAO();
            pd.updateMoney(username, depositMoney_raw);
            
            //tao session moi
            HttpSession session = request.getSession();
            Player a = pd.getPlayerByUsername(username);
            session.setAttribute("player", a);
            
            
            //lay transaction list
            TransactionHistoryDAO thd = new TransactionHistoryDAO();   
            thd.insertTransaction("Nạp", depositMoney, username);
            ArrayList<TransactionHistory> list = thd.getListOfPlayHistoryByUsername(username);
            
            request.setAttribute("noti", "Nạp tiền thành công! Số tiền hiện tại: "+a.getBalance()+"$");
            request.setAttribute("data", list);
            
        } else {
            request.setAttribute("noti", "Tiền nạp vào phải lớn hơn 0$");
        }
        
        
        
        request.getRequestDispatcher("deposit.jsp").forward(request, response);
        
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
