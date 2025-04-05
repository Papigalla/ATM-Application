package com.example.ATMApplication.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.ATMApplication.entity.ATM;
import com.example.ATMApplication.repository.ATMRepository;


@Service
public class ATMService {
	private final ATMRepository repository;

	public ATMService(ATMRepository repository) {
		super();
		this.repository = repository;
	}
	public void addUser(ATM user) {
		repository.save(user);
		
	}



	public boolean displayUser(long cardNumber,int pin) {
	
	List<ATM>user=repository.findAll();
	for(ATM users:user)
	{
		if(cardNumber==users.getCardNumber()&&pin==users.getPin())
		{
			return true;
		}
	}
	return false;
	}


	public String[] fetchcard(long cardNumber) {
		List<ATM> users=repository.findAll();
		String card=null;
		String name1=null;
		for(ATM use:users)
		{
			if(cardNumber==use.getCardNumber())
			{
			card=""+use.getCardNumber();
			name1=use.getFirstName();
			}
			
		}
		System.out.println(card);
		System.out.println(cardNumber);
		return new String[]{card,name1};
		
		
	}


	public void addAmount(int amount,long cardNumber) {
	List<ATM>amounts	=repository.findAll();
	
	   for(ATM use:amounts)
	   {
		   if(use.getCardNumber()==cardNumber) {
			   if(use.getAmount()==0)
			   {
			    use.setAmount(amount);
			   }
			   else
			   {
				   int h=use.getAmount()+amount;
				      use.setAmount(h);
			   }
			  repository.save(use);  
			   
		   }
		   
	   }
		
		
	}



	public List<ATM> balanceAmount(long cardNumber, int pin) {
	    List<ATM> allUsers = repository.findAll();
	    List<ATM> matchedUsers = new ArrayList<>();
	    
	    for (ATM user : allUsers) {
	        if (user.getCardNumber() == cardNumber && user.getPin() == pin) {
	            matchedUsers.add(user); // Collect all matches
	        }
	    }
	    return matchedUsers; // Returns empty list if no matches
	}
			
	

public boolean withdraw(long cardNumber, int pin, int amount) {
			    List<ATM> users = repository.findAll();
			    
			    for (ATM user : users) {
			        if (user.getCardNumber() == cardNumber && user.getPin() == pin) {
			        
			            if (user.getAmount() < amount) {
			                return false; 
			            }
			            
			           
			            int newBalance = user.getAmount() - amount;
			            user.setAmount(newBalance);
			            repository.save(user);
			            return true;
			        }
			    }
			    return false;
			}



public boolean changePin(long cardNumber, int currentPin, int newPin, int confirmPin) {
   
    Optional<ATM> userOpt = repository.findByCardNumber(cardNumber);
    
    
    if (userOpt.isEmpty() || userOpt.get().getPin() != currentPin) {
        return false;
    }
    
    
    if (newPin != confirmPin) {
        return false;
    }
    
    
    ATM user = userOpt.get();
    user.setPin(newPin);
    repository.save(user);
    
    return true;
}


public Map<String, Object> forgot(long cardNumber, String email, long phoneNumber) {
    Optional<ATM> userOpt = repository.findByCardNumber(cardNumber);
    Map<String, Object> response = new HashMap<>();
    
    if(userOpt.isEmpty() || userOpt.get().getCardNumber() != cardNumber || 
       !userOpt.get().getEmail().equals(email) || 
       userOpt.get().getPhoneNumber() != phoneNumber) {
        response.put("valid", false);
        response.put("pin", 0); 
    } else {
        ATM user = userOpt.get();
        response.put("valid", true);
        response.put("pin", user.getPin());
    }
    return response;
}


@Transactional
public Map<String, Object> trans(long toAccount, long fromAccount, int amount, int pin) {
    Map<String, Object> response = new HashMap<>();
    
    
    if(toAccount == fromAccount) {
        response.put("valid", false);  
        response.put("message", "Cannot transfer to same account");
        return response;
    }
    
    Optional<ATM> receiverOpt = repository.findByCardNumber(toAccount);
    Optional<ATM> senderOpt = repository.findByCardNumber(fromAccount);
    
    
    if(receiverOpt.isEmpty() || senderOpt.isEmpty()) {
        response.put("valid", false); 
        response.put("message", "Invalid account details");
        return response;
    }
    
    ATM sender = senderOpt.get();
    ATM receiver = receiverOpt.get();
    
    
    if(sender.getPin() != pin) {
        response.put("valid", false); 
        response.put("message", "Invalid PIN");
        return response;
    }
    
    
    if(sender.getAmount() < amount) {
        response.put("valid", false);
        response.put("message", "Insufficient balance");
        return response;
    }
    
    
    sender.setAmount(sender.getAmount() - amount);
    receiver.setAmount(receiver.getAmount() + amount);
    
    repository.save(sender);
    repository.save(receiver);
    
    
    response.put("valid", true);       
    response.put("message", "Transfer successful");
    response.put("newamount", sender.getAmount());  
    response.put("amount", amount);
    
    return response;
}

}
