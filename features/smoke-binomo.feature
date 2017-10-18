Feature: SMoke test generate 2017-10-18 13:15:01 +0300
 Scenario: Run step
 Given Pid process
 Given Visit page auth_platform
  	Given Visit page CRM
 	When Authorization crm
 	Then Success
  	Given Visit page trading
 	When Open list deals
 	Then Rate by RIC equal percent sum win deal
 
	Given User filters coupons 
	Given Template Bonus
	Given Template Bonus Deposit
	Given Template common - bonus deposit
	Given Template Welcome Bonus Deposit
	Given Template First Deposit Free Deals 
	Given Template Deposit Free Deals

 		And Visit users coupons adds
 	 When Add coupons for users
 	 Then Visit to user from cahsier
 	 Then Activate coupons? 
	Given Testing bonus deposit
	Given Testing balance
	Given Testing bonuses

Scenario:	Then Pool ranning?
