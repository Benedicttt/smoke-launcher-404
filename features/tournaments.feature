Feature: SMoke test generate 2017-10-23 14:07:07 +0300
 Scenario: Run step
 Given Pid process
  
 	Given Tournament
 		When Add data
 	Given Data from
 	Given Data to
 		 When Select type tournament on activate 
 		 When Repeat type periodical 
 		When Created Tournament 'sum deals'
 	Given Percentage
 Then Result
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
 
 Given Visit page auth_platform
 
 	Given Doc protected to
 		Then Protected set done
 
 	Given Phone verified find 
 		Then Phone verifed
 
 Given Visit page Welcome
 	When Fill /welcome
 	Then Redirect pages tutorial and agree risk
 	Then Profile last and first name
 
 Given Mailers yopmail
 	When Input email and find link yopmail 
 	Then Visit to link yopmail
 
 		When Participate
 	Given Find status treder
 	Then Status treder
 
 Given Connect to the CRM provider "WireCapital"
 When Visit cashier WireCapital
 	When Make deposit WireCapital
 	Then Deposit WireCapital created
 
 		When Participate
Given Visit page trading

 When Use real type
 
 	When Make a deals asset GOL/OTC and win bet
 	Then Transactions committed
 

Scenario:	Then Pool ranning?
