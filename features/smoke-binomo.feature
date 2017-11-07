Feature: SMoke test generate 2017-11-07 14:16:24 +0300
 Scenario: Run step
 Given Pid process
 	Given Visit homepage and click soc-reg vk(not ref)
 	When Click my email vk
 	Then Assert page welcome
 	Then Auth soc reg vk
 	Then Assert page welcome
 	Then Delete all providers stage and rename email account
  	Given Visit homepage and click soc-reg google(not ref)
 	When Click my email google
 	Then Assert page welcome
 	Then Auth soc reg google
 	Then Assert page welcome
 	Then Delete all providers stage and rename email account
  	Given Visit homepage and click soc-reg facebook(not ref)
 	When Click my email facebook
 	Then Assert page welcome
 	Then Auth soc reg facebook
 	Then Assert page welcome
 	Then Delete all providers stage and rename email account
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
  	Given Find status treder
 	Then Status treder
  Given Connect to the CRM provider "WireCapital"
 When Visit cashier WireCapital
 	When Make deposit WireCapital
 	Then Deposit WireCapital created
  When Visit cashier WireCapital
 	When Make deposit WireCapital decline
 	Then Before balance
 	When Check status 'Reject' in payment Wire Capital
 	Then After balance
  Given Connect to the CRM provider "Credit card"
 	When Visit cashier CreditCard
 	When Make deposit CreditCard
 	Then Deposit CreditCard created
  	When Visit cashier CreditCard
 	When Make deposit CreditCard decline
 	Then Before balance
 	When Check status 'Reject' in payment Credit Card
 	Then After balance
  Given Connect to the CRM provider "Card Pay"
 When Visit cashier CardPay
 	When Make deposit CardPay
 	Then Deposit CardPay created
  When Visit cashier CardPay
 	When Make deposit CardPay decline
 	When Check status 'Reject' in payment CardPay
 	Then Before balance
 	Then Deposit CardPay decline
 	Then After balance
  	Given Doc protected to
 		Then Protected set done
  Given Created ticket
 	When Data ticket
 	Then Ticket created
  Given Visit payouts
  	When The creation of an application for withdrawal for CreditCard
 	Then Applications created CreditCard
  	When The creation of an application for withdrawal for CardPay
 	Then Applications created CardPay
  	When The creation of an application for withdrawal for WireCapital
 	Then Applications created WireCapital
  	Given Find status treder
 	Then Status treder
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
