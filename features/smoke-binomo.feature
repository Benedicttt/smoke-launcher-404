Feature: SMoke test generate 2018-01-16 12:51:27 +0300
 Scenario: Run step
 Given Pid process
 Given Visit page auth_platform
  	Given Visit to page /account
 	When input all data to page account
 	Then Update params to data page account
 	Given Assert to change params in page account
 






Scenario:	Then Pool ranning?
