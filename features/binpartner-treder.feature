Feature: SMoke test generate 2017-10-16 18:26:38 +0300
 Scenario: Run step partner
 Given Pid process
 
 Given Visit with partner refcode
 	When Registration traider refcode
 	Then Email, locale, id, currency - partner
 
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
 

 Given Connect to the CRM provider "WireCapital"
 When Visit cashier WireCapital
 	When Make deposit WireCapital
 	Then Deposit WireCapital created
 
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
 
 Given Visit payouts
 
 	When The creation of an application for withdrawal for CreditCard
 	Then Applications created CreditCard
 
 	When The creation of an application for withdrawal for CardPay
 	Then Applications created CardPay
 
Given Visit page trading

 When Use real type
 
 	When Make a deals asset GOL/OTC and win bet
 	Then Transactions committed
 

 	Given Find status treder
 	Then Status treder
 
 Given Visit page CRM
 	When Authorization crm
 	Then Success
 
 Given Visit the page for payments confirmation
 	When At the request of the payments and Payment committed
 

Scenario:	Then Pool ranning?
