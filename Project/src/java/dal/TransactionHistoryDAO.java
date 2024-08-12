/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Player;
import model.TransactionHistory;


/**
 *
 * @author DELL
 */
public class TransactionHistoryDAO extends DBContext {
    
    public ArrayList<TransactionHistory> getListOfPlayHistoryByUsername(String username) {
        ArrayList<TransactionHistory> list = new ArrayList<>();

        String sql = "select * from TransactionHistory where  Username=? ORDER BY ID DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                PlayerDAO pd = new PlayerDAO();
                Player p = pd.getPlayerByUsername(username);

                TransactionHistory c = new TransactionHistory(rs.getInt("ID"),
                        rs.getString("type"),
                        rs.getDouble("amount"),
                        p);
                list.add(c);
                
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insertTransaction(String type, double amount, String username) {

        String sql = "INSERT INTO TransactionHistory (ID, Type, Amount, Username) VALUES"
                + " ((SELECT ISNULL(MAX(ID) + 1, 1) FROM TransactionHistory WHERE ID > 0), ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, type);
            st.setDouble(2, amount);
            st.setString(3, username);
            st.executeUpdate();
            System.out.println("Transaction inserted successfully.");
        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    
    //delete
    public void delete(int id){
        String sql = "delete from [dbo].[TransactionHistory] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    //test connection
    public static void main(String[] args) {
        TransactionHistoryDAO phd = new TransactionHistoryDAO();

        phd.insertTransaction("test", 100, "thnhphng04");
        
        ArrayList<TransactionHistory> list = phd.getListOfPlayHistoryByUsername("thnhphng04");
        
        for(int i=0; i<list.size(); i++){
            System.out.print(list.get(i).getID());
            System.out.print(list.get(i).getTypeString());
            System.out.println(list.get(i).getAmount());
        }
        
    }
    
}
