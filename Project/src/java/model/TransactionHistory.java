/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class TransactionHistory {
    int ID;
    String typeString;
    Double amount;
    Player p;

    public TransactionHistory() {
    }

    public TransactionHistory(int ID, String typeString, Double amount, Player p) {
        this.ID = ID;
        this.typeString = typeString;
        this.amount = amount;
        this.p = p;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTypeString() {
        return typeString;
    }

    public void setTypeString(String typeString) {
        this.typeString = typeString;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Player getP() {
        return p;
    }

    public void setP(Player p) {
        this.p = p;
    }

    
    
    
}
