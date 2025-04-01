package com.example.ATMApplication.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ATMApplication.entity.ATM;



@Repository
public interface ATMRepository extends JpaRepository<ATM, Integer> {
	 Optional<ATM> findByCardNumber(long cardNumber);
    Optional<ATM> findByCardNumberAndPin(long cardNumber, int pin);

}
