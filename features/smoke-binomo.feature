Feature: SMoke test generate 2018-01-10 16:24:58 +0300
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
  	Given Visit to page /account
 	When input all data to page account
 	Then Update params to data page account
 	Given Assert to change params in page account
  	Given Phone verified find 
 		Then Phone verifed
  	Given Find status treder
 	Then Status treder
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
  When Use demo type
  	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 






Scenario:	Then Pool ranning?
