Feature: SMoke test generate 2017-11-24 19:41:30 +0300
 Scenario: Run step
 Given Pid process
 Given Visit page auth_platform
  	Given Visit page CRM
 	When Authorization crm
 	Then Success
 


	Given Template common - bonus deposit
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
