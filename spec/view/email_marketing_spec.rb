require "spec_helper"
require "rails_helper"

RSpec.describe "Capybara" , type: :view do
  app_host = "http://localhost:3000"

  context " find class binomo" do
    before(:each) do
      visit app_host + "/binomo/email_marketing"
    end

    it "Url email marketing" do
      visit app_host + "/binomo/email_marketing"
      expect(current_url).to eq("#{app_host}/binomo/email_marketing")
      expect(page.status_code) == 200
    end

    it { expect(page.status_code) == 200  }

    it "find pid procces button" do
      expect(page).to have_selector('.pid_process')
    end
    it "find ws_sender button" do
      expect(page).to have_selector('.ws_sender')
    end
    it "find cucumber button" do
      expect(page).to have_selector('.step_cucumber')
    end
    it "find arrow image" do
      expect(page).to have_selector('.arrow')
    end
    it "find reload arrow" do
      expect(page).to have_selector('.reload-page')
    end
    it "find select stage" do
      expect(page).to have_select('generator_stage', options:["s1", "s2", "s3", "s4", "prod"])
    end
    it "find select driver" do
      expect(page).to have_select('generator_driver', options:["chrome", "webkit", "firefox", "safari"] )
    end
    it "find select faramework" do
      expect(page).to have_select('generator_work', options:["rspec", "cucumber"])
    end
    it "find select currency" do
      expect(page).to have_select('generator_currency', options:["RUB", "USD", "EUR"])
    end
    it "find select locale" do
      expect(page).to have_select('generator_chk_locale', options: %w(ru en id ms es th vn cn pt zw).map(&:upcase))
    end
    it "find select sleep after deposit or cashier" do
      expect(page).to have_select('generator_sleep_retried', options:%w(5 10 15 20 25 30 60))
    end
  end
end

RSpec.describe "Capybara" , type: :view do
  app_host = "http://localhost:3000"

  context " find class binomo" do
    before(:each) do
      visit app_host + "/binomo/email_marketing"
    end

      it { expect(page.status_code) == 200  }
      it { expect( find(:css, '#generator_global_ckeckbox_check').value ).to eq('check') }
      it { expect( find(:css, '#generator_scenario_confirmed').value ).to eq('confirmed') }
      it { expect( find(:css, '#generator_scenario_yopmail').value ).to eq('yopmail') }
      it { expect( find(:css, '#generator_scenario_cashier').value ).to eq('cashier') }
      it { expect( find(:css, '#generator_scenario_authorization').value ).to eq('authorization') }
      it { expect(page).to have_selector "#generator_scenario_registration", visible: true }
    end


  context "Not find class binomo" do
    after(:each) do
      visit app_host
    end

    it "find pid procces button" do
      expect(page).to have_no_selector('.pid_process')
    end
    it "find ws_sender button" do
      expect(page).to have_no_selector('.ws_sender')
    end
    it "find ws_sender button" do
      expect(page).to have_no_selector('.step_cucumber')
    end
    it "find arrow image" do
      expect(page).to have_no_selector('.arrow')
    end
    it "find reload arrow" do
      expect(page).to have_no_selector('.reload-page')
    end
    it "find select stage" do
      expect(page).to have_no_select('generator_stage', options:["s1", "s2", "s3", "s4", "prod", "locale"])
    end
    it "find select driver" do
      expect(page).to have_no_select('generator_driver', options:["chrome", "webkit", "firefox", "safari"])
    end
    it "find select faramework" do
      expect(page).to have_no_select('generator_work', options:["rspec", "cucumber"])
    end
    it "find select currency" do
      expect(page).to have_no_select('generator_currency', options:["RUB", "USD", "EUR"])
    end
    it "find select locale" do
      expect(page).to have_no_select('generator_chk_locale', options:["ru", "en", "id", "ms", "es","th", "vn"])
    end
    it "find select sleep after deposit or cashier" do
      expect(page).to have_no_select('generator_sleep_retried', options:["5", "10", "15", "20", "25","30", "60"])
    end
  end
end
