/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.print.attribute.standard.PDLOverrideSupported;
import model.Player;

/**
 *
 * @author DELL
 */
public class PlayerDAO extends DBContext {

    //check username va password, return Player
    public Player check(String username, String password) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[Name]\n"
                + "      ,[BankName]\n"
                + "      ,[BankAccountNumber]\n"
                + "      ,[Balance]\n"
                + "  FROM [dbo].[Player] where username=? and password=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Player a = new Player(rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Name"),
                        rs.getString("BankName"),
                        rs.getString("BankAccountNumber"),
                        rs.getDouble("Balance"));
                return a;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    //check username va password, return Player
    public Player getPlayerByUsername(String username) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[Name]\n"
                + "      ,[BankName]\n"
                + "      ,[BankAccountNumber]\n"
                + "      ,[Balance]\n"
                + "  FROM [dbo].[Player] where username=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Player a = new Player(rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Name"),
                        rs.getString("BankName"),
                        rs.getString("BankAccountNumber"),
                        rs.getDouble("Balance"));
                return a;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    //insert a player
    public void insert(Player c) {
        String sql = "insert into Player values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, c.getPassword());
            st.setString(3, c.getName());
            st.setString(4, c.getBankName());
            st.setString(5, c.getBankAccountNumber());
            st.setDouble(6, c.getBalance());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //tinh tien
    public void updateMoney(String username, String betMoney) {
        String sql = "UPDATE [dbo].[Player]\n"
                + "SET [balance] = [balance] + ?\n"
                + "WHERE [username] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, betMoney);
            st.setString(2, username);
            

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    
    //update Information
    public void updateByUserName(String username, String name, String bankName, String bankAccountNumber){
        String sql = "UPDATE [dbo].[Player]\n"
                + "SET [name] =  ?,\n"
                    + "[bankName] =  ?,\n"
                    + "[bankAccountNumber] =  ?\n"
                    + "Where [username] = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, bankName);
            st.setString(3, bankAccountNumber);
            st.setString(4, username);
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    //update password
    public void updatePasswordByUserName(String username, String newPass){
        String sql = "UPDATE [dbo].[Player]\n"
                + "SET [password] =  ?\n"
                    + "Where [username] = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPass);
            st.setString(2, username);
            
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public String getPasswordByUsername(String username){
        String sql = "SELECT [Password]\n"
                + "  FROM [dbo].[Player] where username=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getString("Password");
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
        
    }
    
    //test connection
    public static void main(String[] args) {
        Player a = new Player();

        PlayerDAO d = new PlayerDAO();
        
        
        
        
        
        a = d.getPlayerByUsername("thnhphng04");
        System.out.println(a.getBalance());
        
        d.updateMoney("thnhphng04", "+49000");
        
        Player b = d.getPlayerByUsername("thnhphng04");
        System.out.println(b.getBalance());
    }

}
