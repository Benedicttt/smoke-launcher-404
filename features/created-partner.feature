Feature: SMoke test generate 2017-10-18 16:37:59 +0300
 Scenario: Run step partner
 Given Pid process
 

Scenario:	Then Pool ranning?
 Given Receive a ref-code 
 Given Open page modify country
 When Set modify country null
 
 Given Visit to page partner.com
 	When Partner registration
 	Then Registered partner
 
 Given Select only tarrif first 
 Given Select only tarrif percent 
 Given Select only tarrif CPA 
 Given Select only tarrif CPA % 
 Given Select only tarrif CPL SOI 
 Given Select only tarrif CPL DOI 
 Given Visit to page profile partner
 	When Total information
 	When Security
 	When Administration
 	When Notes
 	Then The figures are not reset when you save
 
