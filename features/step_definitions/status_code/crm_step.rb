Given(/^Visit all page crm, status code page$/) do
  DRIVER.get CommonSetting[:url_page_crm]
  DRIVER.manage.add_cookie name: "_crm_binomo_com_session", value: "Z1pjL2FOU0pTVUg1ZUc2Z3lwZnM1SlV1ZjQ3Q1pQWTFJbnk5MnZMV1BwdWRZUGF1VCtiSzZWTEcvV2lzamxOZGlWT09HTlV2aFBzYWtGR0dTUEtOSUNNWXUvM2NLSDJPMEl1YW9QRmNOdkRRcWc4Ujl6dlQvY25pVlAyZGQ5VWNuRU9KUCtPd0tvTVAyclFzS0M4eE5iRncvRG5wM29RdTg4WUJCMW1WalM4RFhQS2duMk5EcmtCMjJXM01uY3FMLS1taGVkbDJ5Zk1nSEZkSFgvd25YRk5BPT0%3D--4348dac73f4621d58004ca274e5ba0a3606fc96a"
  DRIVER.manage.add_cookie name: "crm_user_id", value: "MzE%3D--e5fc5953804cefddbc38c963fea880e84941d866"
  sleep 1
  DRIVER.get CommonSetting[:url_page_crm]
  sleep 1

  link_page = File.read("./features/step_definitions/status_code/pages/crm_200")
  link_page.each_line do |link|
    status_code_pages(DRIVER, CommonSetting[:url_page_crm] + link.to_s)
  end

  link = File.read("./features/step_definitions/status_code/pages/crm_parse_200")
  link.each_line do |link|
    status_code_pages(DRIVER, CommonSetting[:url_page_crm] + link.to_s)
    sleep 1
  end
end
