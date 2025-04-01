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
	/*long card = 0;
	int pins =0;
		List<ATM> user=repository.findAll();
		for(ATM users:user)
		{
			 card=users.getCardNumber();
			 pins=users.getPin();
		}
		
	if(cardNumber==card && pins==pin)
	{
		
		return true;
	}
	else
	{
		return false;
	}*/
		
		//---------------------------------------
	List<ATM>user=repository.findAll();
	for(ATM users:user)
	{
		if(cardNumber==users.getCardNumber()&&pin==users.getPin())
		{
			return true;
		}
	}
	return false;
	
	/*	Optional<ATM> user=repository.findByEmailId(emailId);
		if(user.isPresent())
		{
		return user.get().getPassword().equals(password);
		}
		return false;*/
		
		
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


/*	public List<RegistUser> balanceAmount(long cardNumber, int pin) {
		long card = 0;
		int pins =0;
	      RegistUser  foundObject=null;
		long cardNumbers=cardNumber;
			List<RegistUser> user=repository.findAll();
			for(RegistUser users:user)
			{
				 card=users.getCardNumber();
				 pins=users.getPin();
				 if(cardNumber==card && pins==pin)
				 {
					if(users.getCardNumber().equals(cardNumbers))
					{
						foundObject=users;
						break;
					}
				 }
				 
			
			}
			if(foundObject!=null)
			{
				return foundObject;
			}
			else
			{
				return null;
			}
	}*/
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
			
	/*	if(cardNumber==card && pins==pin)
		{
			
		   return user;
		}
		else
		{
			return null;
		}
		*/
		
		
	//}
	
	/*public ATM getUserByCredentials(long cardNumber, int pin) {
	    return repository.findAll().stream()
	        .filter(u -> u.getCardNumber() == cardNumber && u.getPin() == pin)
	        .findFirst()
	        .orElse(null);
	}*/
	

	/*public String[] withdraw(long cardNumber, int pin, int amount) {
		List<ATM>amounts	=repository.findAll();
		
		   for(ATM use:amounts)
		   {
			   if(use.getCardNumber()==cardNumber&&use.getPin()==pin) {
				  
				   if (use.getAmount() < amount) {
		                return false; 
		            }
		            
		          
		            int newBalance = use.getAmount() - amount;
		            use.setAmount(newBalance);
		            repository.save(use);
		            return true;
				  
				   }
			   }
		   return new String[true,false];
			   
		   }*/

public boolean withdraw(long cardNumber, int pin, int amount) {
			    List<ATM> users = repository.findAll();
			    
			    for (ATM user : users) {
			        if (user.getCardNumber() == cardNumber && user.getPin() == pin) {
			            // First check if balance is sufficient
			            if (user.getAmount() < amount) {
			                return false; // or throw new InsufficientBalanceException()
			            }
			            
			            // Only perform withdrawal if balance is sufficient
			            int newBalance = user.getAmount() - amount;
			            user.setAmount(newBalance);
			            repository.save(user);
			            return true;
			        }
			    }
			    return false;
			}


/*public void transfering(long cardNumber,long cardNumberf, int amount, int pin) {
  List<ATM>user=repository.findAll();	
  for(ATM users:user)
  {
	  if (users.getCardNumber() == cardNumber && users.getPin() == pin) {
		  if(users.getCardNumber()==cardNumberf)
		  {
			  if (users.getAmount() < amount) {
	                return false;
	            } 
			  int newBalance = users.getAmount() - amount;
	            users.setAmount(newBalance);
		  }
	  
	  }
  }
  
  }*/
/*@Service
public class TransferService {
    
    @Autowired
    private RegisRepository repository;*/
    
 /*   public TransferResponse transferMoney(long toAccount, long fromAccount, int amount, int pin) {
        // Find sender account
        RegistUser sender = repository.findByCardNumberAndPin(fromAccount, pin)
            .orElseThrow(() -> new RuntimeException("Invalid card number or PIN"));
        
        // Check if sender has sufficient balance
        if (sender.getAmount() < amount) {
            return new TransferResponse(false, "Insufficient balance", 
                                      fromAccount, toAccount, amount, sender.getAmount());
        }
        
        // Find receiver account
        RegistUser receiver = repository.findByCardNumber(toAccount)
            .orElseThrow(() -> new RuntimeException("Receiver account not found"));
        
        // Perform transfer
        sender.setAmount(sender.getAmount() - amount);
        receiver.setAmount(receiver.getAmount() + amount);
        
        // Save both accounts
        repository.save(sender);
        repository.save(receiver);
        
        return new TransferResponse(true, "Transfer successful", 
                                  fromAccount, toAccount, amount, sender.getAmount());
    }*/




/*public boolean changePin(long cardNumber, int currentPin, int newPin, int confirmPin) {
      List<RegistUser>use=repository.findAll();
      List<RegistUser> matchedUsers = new ArrayList<>();
      int pins=newPin;
	
      for(RegistUser users:use)
      {
    	  if(cardNumber==users.getCardNumber()&&users.getPin()==currentPin)
    	  {
    		  matchedUsers.add(users);
    	       if(newPin==confirmPin)
    	        {
    	           for(RegistUser userss:matchedUsers)
                    {
        	           userss.setPin(pins);
                     }
                 }
      
	
           }
       }
      return false;
      
      }*/
/*public boolean changePin(long cardNumber, int currentPin, int newPin, int confirmPin) {
    
    RegistUser user = repository.findByCardNumber(cardNumber);
    
    
    if (user == null || user.getPin() != currentPin) {
        return false;
    }
    
   
    if (newPin != confirmPin) {
        return false;
    }
    
    
    user.setPin(newPin);
    repository.save(user); 
    
    return true;
}*/
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


/*public Map<String, Object> trans(long toAccount, long fromAccount, int amount, int pin) {
	 Optional<RegistUser> userOpt = repository.findByCardNumber(toAccount);
	 Optional<RegistUser> userOpt1 = repository.findByCardNumber(fromAccount);
	 Map<String, Object> response = new HashMap<>();
	 int money = 0;
	 int moneys=0;
	 
	 if(userOpt.isEmpty()||userOpt.get().getCardNumber()!=toAccount||userOpt.get().getPin()!=pin||userOpt1.isEmpty()||userOpt1.get().getCardNumber()!=fromAccount)
	 {
		 response.put("invalid",false);
		 
		 
	 }
	 else
	 {
		 int sender=userOpt.get().getAmount();
		int receiver= userOpt1.get().getAmount();
		if(sender>=0)
		{
		  money= receiver+amount;
		  userOpt1.get().setAmount(money);
		  moneys=sender-amount;
		  userOpt.get().setAmount(moneys);
		}
		response.put("valid",true);
		response.put("fromAccount", userOpt.get().getCardNumber());
		response.put("toaccount", userOpt1.get().getCardNumber());
		response.put("amount", amount);
		response.put("newamount", moneys);
		
	 }
	 return response;
}*/
@Transactional
public Map<String, Object> trans(long toAccount, long fromAccount, int amount, int pin) {
    Map<String, Object> response = new HashMap<>();
    
    // Validate same account transfer
    if(toAccount == fromAccount) {
        response.put("success", false);
        response.put("message", "Cannot transfer to same account");
        return response;
    }
    
    Optional<ATM> receiverOpt = repository.findByCardNumber(toAccount);
    Optional<ATM> senderOpt = repository.findByCardNumber(fromAccount);
    
    // Validate accounts exist
    if(receiverOpt.isEmpty() || senderOpt.isEmpty()) {
        response.put("success", false);
        response.put("message", "Invalid account details");
        return response;
    }
    
    ATM sender = senderOpt.get();
    ATM receiver = receiverOpt.get();
    
    // Validate PIN
    if(sender.getPin() != pin) {
        response.put("success", false);
        response.put("message", "Invalid PIN");
        return response;
    }
    
    // Validate sufficient balance
    if(sender.getAmount() < amount) {
        response.put("success", false);
        response.put("message", "Insufficient balance");
        return response;
    }
    
    // Perform transfer
    sender.setAmount(sender.getAmount() - amount);
    receiver.setAmount(receiver.getAmount() + amount);
    
    repository.save(sender);
    repository.save(receiver);
    
    // Prepare response
    response.put("success", true);
    response.put("message", "Transfer successful");
    response.put("fromAccount", fromAccount);
    response.put("toAccount", toAccount);
    response.put("amountTransferred", amount);
    response.put("fromAccountNewBalance", sender.getAmount());
    
    return response;
}

}
