Feature: SMoke test generate 2017-10-18 14:32:26 +0300
 Scenario: Run step partner
 Given Pid process
 
 Given Visit with partner refcode
 	When Registration traider refcode
 	Then Email, locale, id, currency - partner
 
Given Visit page trading

Scenario:	Then Pool ranning?
