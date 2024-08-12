/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class PlayHistory {
    int ID;
    String game;
    String detail;
    double betMoney;
    double collectedMoney;
    Player p;

    public PlayHistory() {
    }

    public PlayHistory(int ID, String game, String detail, double betMoney, double collectedMoney, Player p) {
        this.ID = ID;
        this.game = game;
        this.detail = detail;
        this.betMoney = betMoney;
        this.collectedMoney = collectedMoney;
        this.p = p;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getGame() {
        return game;
    }

    public void setGame(String game) {
        this.game = game;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public double getBetMoney() {
        return betMoney;
    }

    public void setBetMoney(double betMoney) {
        this.betMoney = betMoney;
    }

    public double getCollectedMoney() {
        return collectedMoney;
    }

    public void setCollectedMoney(double collectedMoney) {
        this.collectedMoney = collectedMoney;
    }

    public Player getP() {
        return p;
    }

    public void setP(Player p) {
        this.p = p;
    }

    
    
    
}
