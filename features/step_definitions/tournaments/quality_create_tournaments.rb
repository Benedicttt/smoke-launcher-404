When /^Quality create tournaments$/ do
  DRIVER.get(CommonSetting[:url_page_crm])
  sleep 1
  if DRIVER.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      DRIVER.find_element(:css, 'input[value="Sign in"]').click
    end
  end

  api = RestClient::Request.execute(
    method: :get,
    url: "https://#{ENV['stage']}.binomo.com/api/v2/tournaments",
     headers: {
       params: {
         locale: "ru", device: "web"
         }}) { |response, request, result, &block| response}

   tournaments = JSON.parse(api.body)

   ids = []
   ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['name'].split[0] == "ru" }
   id = ids[0].compact.max

  ENV['count_tournaments'].to_i.times do
    DRIVER.get CommonSetting[:url_page_crm] + "tournaments"
    sleep 1
    DRIVER.find_element(:xpath, "//*[@class='table']/tbody/tr/td[text() = '#{id}']//../td[text() = 'pending']/../td/a[text()='Copy']").click
    sleep 1
    DRIVER.execute_script("$('.text:contains(\"Activated\")').click()")
    DRIVER.execute_script("$('.text:contains(\"None\")').click()")
    sleep 0.5


    DRIVER.find_element(:id, 'tournament_date_from').clear
    sleep 0.5
    DRIVER.find_element(:id, 'tournament_date_from').send_keys(Time.parse(ENV['data_from']) + 10.seconds)
    DRIVER.find_element(:id, 'tournament_date_to').clear
    sleep 0.5

    banner = File.join(Rails.root, './app/assets/images/bg.jpeg')
    DRIVER.find_element(:id, "tournament_banner_content").send_keys(banner)
    DRIVER.find_element(:id, "tournament_banner_preview").send_keys(banner)

    DRIVER.find_element(:id, 'tournament_date_to').send_keys(ENV['data_to'])
    sleep 0.5
    DRIVER.find_element(:css, '.button').click
    sleep 1
    puts_info DRIVER.current_url
  end
end
