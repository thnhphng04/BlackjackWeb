/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Player {
    /*
    Username nvarchar(50) primary key,
 Password nvarchar(50),
 Name nvarchar(50),
 BankName nvarchar(50),
 BankAccountNumber int,
     */
    private String username, password, name, bankName, bankAccountNumber;
    double balance;

    public Player() {
    }

    public Player(String username, String password, String name, String bankName, String bankAccountNumber, double balance) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.bankName = bankName;
        this.bankAccountNumber = bankAccountNumber;
        this.balance = balance;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankAccountNumber() {
        return bankAccountNumber;
    }

    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    
    
    
}
