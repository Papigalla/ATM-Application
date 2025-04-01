package com.example.ATMApplication.entity;

public class TransferRespo {
	 private String status;
	    private String message;
	    private long fromAccount;
	    private long toAccount;
	    private int amountTransferred;
	    private int fromAccountNewBalance;
	    
	    // Constructor, getters, and setters
	    public TransferRespo(String status, String message, long fromAccount, 
	                          long toAccount, int amountTransferred, int fromAccountNewBalance) {
	        this.status = status;
	        this.message = message;
	        this.fromAccount = fromAccount;
	        this.toAccount = toAccount;
	        this.amountTransferred = amountTransferred;
	        this.fromAccountNewBalance = fromAccountNewBalance;
	    }
	    
	    // Getters and setters...
	    public String getStatus() { return status; }
	    public String getMessage() { return message; }
	    public long getFromAccount() { return fromAccount; }
	    public long getToAccount() { return toAccount; }
	    public int getAmountTransferred() { return amountTransferred; }
	    public int getFromAccountNewBalance() { return fromAccountNewBalance; }

}
