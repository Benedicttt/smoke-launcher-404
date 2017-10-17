Feature: SMoke test generate 2017-10-17 20:54:24 +0300
 Scenario: Run step
 Given Pid process
 Given Visit page auth_platform
 Given Visit page trading
 When Use real type
  	When Make a deals asset GOL/OTC and win bet
 	Then Transactions committed
  	Given Visit page CRM
 	When Authorization crm
 	Then Success
  	Given Add widget
  Given Visit the page for payments application rejection
 	When Rejection of an application and Application is rejected

 Given Visit page profile User
 	When Select manager
 	Then Manager selected
  When Enter a comments on your profile page
 	Then Comments inserted
  Given Visit page tickets
 	When Enter a comment on your tickets
 	Then Response to a request issued
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
