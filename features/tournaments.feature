Feature: SMoke test generate 2017-11-22 15:06:12 +0300
 Scenario: Run step
 Given Pid process
  
 	Given Tournament
 		When Add data
 	Given Data from
 	Given Data to
 When Use demo type
 
 	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 

Scenario:	Then Pool ranning?
