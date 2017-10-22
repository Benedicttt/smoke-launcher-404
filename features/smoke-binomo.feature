Feature: SMoke test generate 2017-10-22 23:14:45 +0300
 Scenario: Run step
 Given Pid process
 Given Preparation of static data and visit homepage
 	When Registration traider
 	Then Email, locale, id, currency
  When Use demo type
  	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
  	Given Activate all templates
 






Scenario:	Then Pool ranning?
