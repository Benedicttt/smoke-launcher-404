Feature: SMoke test generate 2017-10-19 13:25:02 +0300
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
 
 Given Created postback
 	When  Enter data
 	Then Data is entered
 	When Activate postback
 
 Given Visit to page binpartner.com
 Then Add data form
 Then Click button Sign in and Authorize to partner.com
 
 Given Add promo forms registartions
 Given Open registration forms
 	When Add data input and submit registration
 		Then Assert registartion
 Given Open registration forms
 	When Add data input and submit registration new
 		Then Assert registartion new
 
