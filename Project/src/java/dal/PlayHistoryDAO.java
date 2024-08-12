/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.PlayHistory;
import model.Player;

/**
 *
 * @author DELL
 */
public class PlayHistoryDAO extends DBContext {

    public ArrayList<PlayHistory> getListOfPlayHistoryByUsername(String username) {
        ArrayList<PlayHistory> list = new ArrayList<>();

        String sql = "select * from PlayHistory where  Username=? ORDER BY ID DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                PlayerDAO pd = new PlayerDAO();
                Player p = pd.getPlayerByUsername(username);

                PlayHistory c = new PlayHistory(rs.getInt("ID"),
                        rs.getString("game"),
                        rs.getString("detail"),
                        rs.getDouble("BetMoney"),
                        rs.getDouble("CollectedMoney"),
                        p);
                list.add(c);
                
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<PlayHistory> getListByPage(ArrayList<PlayHistory> list,
            int start, int end) {
        ArrayList<PlayHistory> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void insert(String username, String money, String dealerTotal, String playerTotal) {
        //xu li cac bien
        Double betMoney = Double.parseDouble(money);
        int ID;
        String collectedMoney;
        String detail = "Điểm của bạn: " + playerTotal + " - Điểm của dealer: " + dealerTotal;;
        
        if (betMoney >= 0) {
            collectedMoney = String.valueOf(2 * betMoney);
            detail = "THẮNG -- "+detail;
        } else {
            betMoney = 0-betMoney;
            collectedMoney = "0";
            detail = "THUA --- "+detail;
        }
        
        String betMoneyString = String.valueOf(betMoney);

        //sql
        String sql = "INSERT INTO PlayHistory (ID, Game, Detail, BetMoney, CollectedMoney, Username)\n"
                + "VALUES (\n"
                + "    (SELECT ISNULL(MAX(ID) + 1, 1) FROM PlayHistory WHERE ID > 0),\n"
                + "    ?,\n"
                + "    ?,\n"
                + "    ?, -- BetMoney value\n"
                + "    ?, -- CollectedMoney value\n"
                + "    ?\n"
                + ");";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "BlackJack");
            st.setString(2, detail);
            st.setString(3, betMoneyString);
            st.setString(4, collectedMoney);
            st.setString(5, username);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    
    //xoa lich su choi
    public void delete(int id){
        String sql = "delete from [dbo].[PlayHistory] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //test connection
    public static void main(String[] args) {
        PlayHistoryDAO phd = new PlayHistoryDAO();

        List<PlayHistory> list = phd.getListOfPlayHistoryByUsername("thnhphng04");
        
        
        for(int i=0; i<list.size(); i++){
            System.out.println(list.get(i).getID());
        }
    }

}
