Feature: SMoke test generate 2017-11-20 15:21:16 +0300
 Scenario: Run step
 Given Pid process
  

	Given Last select provider to crm(Eccompay)

 	Given Set sales manage all
 	Given Set Assets: break: true, dynamic: -300, win rate: 70
 	Given Set SMTP server default
 	Given Set Mail provider SendGrid
 	Given Set Captcha sign_in false
 	Given Set Captcha sign_up false
 	Given Set Tutorial false
 	Given CFD enabled true

 	Given Set max demo deals at once 20

 	Given Set Server webinar time
 	Given Set URL webinar

 	Given Set daily asset ric GOL/OTC, percents 60
	Given Update one user admin
	Given Create one preset

 	Given Set percet rate and time
 	Given Set ric GOL/OTC all defaults params

 	Given Set USD currency defaults params





