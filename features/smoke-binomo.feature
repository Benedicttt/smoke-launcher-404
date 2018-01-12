Feature: SMoke test generate 2018-01-12 17:57:56 +0300
 Scenario: Run step
 Given Pid process
 	Given Visit page CRM
 	When Authorization crm
 	Then Success
  Given Visit the page for payments confirmation
 	When At the request of the payments and Payment committed
  	Given Visit page trading
 	When Open list deals
 	Then Rate by RIC equal percent sum win deal
 
	Given User filters coupons 
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
