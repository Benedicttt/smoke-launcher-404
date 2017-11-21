Feature: SMoke test generate 2017-11-21 17:01:09 +0300
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
	Given Checking all manager true
	Given Update one user admin
	Given Create one preset

 	Given Set percet rate and time
 	Given Set ric GOL/OTC all defaults params

 	Given Set USD currency defaults params

	Given Update page privacy
 	Given Update page agreement

 	Given Create new article
	Given Update title by home page
	Given Add and update new link
	Given Create new strategies
	Given Create new technical article
	Given Create new invest idea
	Given Add new video
	Given Add new press articles

	Given Add ticket category
	Given Update windgets
	Given Update all advises

	Given Update first group
	Given Update and set first group by question

	Given Create new mailer

	Given Create new static

