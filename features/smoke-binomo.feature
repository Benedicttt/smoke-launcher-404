Feature: SMoke test generate 2017-11-20 16:18:27 +0300
 Scenario: Run step
 Given Pid process
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
  Given Visit page auth_platform
  	Given Phone verified find 
 		Then Phone verifed
  Given Visit page Welcome
 	When Fill /welcome
 	Then Redirect pages tutorial and agree risk
 	Then Profile last and first name
  Given Mailers yopmail
 	When Input email and find link yopmail 
 	Then Visit to link yopmail
  	Given Doc protected to
 		Then Protected set done
  Given Created ticket
 	When Data ticket
 	Then Ticket created
  	Given Find status treder
 	Then Status treder
 Given Visit page trading
 When Use demo type
  	When Make a deals asset GOL/OTC and win bet
 	Then Transactions committed
  	Given Visit page CRM
 	When Authorization crm
 	Then Success
  Given Last select provider to crm(Eccompay)
  Given Visit page profile User
 	When Select manager
 	Then Manager selected
  When Enter a comments on your profile page
 	Then Comments inserted
  Given Visit page tickets
 	When Enter a comment on your tickets
 	Then Response to a request issued
 
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
