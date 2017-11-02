Feature: SMoke test generate 2017-11-02 18:54:53 +0300
 Scenario: Run step
 Given Pid process
  
 	Given Tournament
 		When Add data
 	Given Data from
 	Given Data to
 		 When Select type tournament on activate 
 		 When Repeat type periodical 
 		When Created Tournament 'max demo balance'
 	Given Fixed
 Then Result

Scenario:	Then Pool ranning?
