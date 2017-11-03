Feature: SMoke test generate 2017-11-03 17:12:11 +0300
 Scenario: Run step
 Given Pid process
 	Given Visit page CRM
 	When Authorization crm
 	Then Success
 

	Given Template Bonus
	Given Template Bonus Deposit
 	Given Template Free Deals
	Given Template common - bonus deposit


 		And Visit users coupons adds
 	 When Add coupons for users
 	 Then Visit to user from cahsier
 	 Then Activate coupons? 
	Given Testing bonus deposit
	Given Testing free deals
	Given Testing balance
	Given Testing bonuses

Scenario:	Then Pool ranning?
