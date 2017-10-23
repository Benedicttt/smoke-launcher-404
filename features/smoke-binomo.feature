Feature: SMoke test generate 2017-10-23 13:50:41 +0300
 Scenario: Run step
 Given Pid process
 Given Visit page auth_platform
  	Given Visit page CRM
 	When Authorization crm
 	Then Success
 

	Given Template Bonus Deposit
	Given Template common - bonus deposit


 		And Visit users coupons adds
 	 When Add coupons for users
 	 Then Visit to user from cahsier
 	 Then Activate coupons? 
	Given Testing bonus deposit

Scenario:	Then Pool ranning?
