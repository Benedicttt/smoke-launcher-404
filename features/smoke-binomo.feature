Feature: SMoke test generate 2017-10-30 14:30:59 +0300
 Scenario: Run step
 Given Pid process
 Given Visit page auth_platform
  	Given Visit page CRM
 	When Authorization crm
 	Then Success
 

	Given Template Bonus
	Given Template Bonus Deposit
 	Given Template Free Deals
	Given Template common - bonus deposit
	Given Template Welcome Bonus Deposit
	Given Template First Deposit Free Deals 
	Given Template Deposit Free Deals

 		And Visit users coupons adds
 	 When Add coupons for users
 	 Then Visit to user from cahsier
 	 Then Activate coupons? 
	Given Testing bonus deposit
	Given Testing free deals
	Given Testing balance
	Given Testing bonuses

Scenario:	Then Pool ranning?
