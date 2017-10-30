Feature: SMoke test generate 2017-10-30 16:20:12 +0300
 Scenario: Run step partner
 Given Pid process
 

Scenario:	Then Pool ranning?
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
 
