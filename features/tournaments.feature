Feature: SMoke test generate 2017-12-04 11:30:39 +0300
 Scenario: Run step
 Given Pid process
  
 	Given Tournament
 		When Add data
 	Given Data from
 	Given Data to
 		 When Select type tournament on activate 
 		When Created Tournament 'sum deals'
 	Given Fixed
 Then Result
 When Use demo type
 
 	When Make a deals asset GOL/OTC and lose bet
 	Then Transactions committed
 

Scenario:	Then Pool ranning?
