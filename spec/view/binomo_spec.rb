require "spec_helper"
require "rails_helper"

RSpec.describe "Capybara" , type: :view do
  app_host = "http://localhost:3001"

  before(:each) do
    visit app_host + "/homepage/select_binomo"
  end

  it "Url root" do
    visit app_host
    expect(current_url).to eq("#{app_host}/homepage")
    expect(page.status_code) == 200

  end

  it "visit /homepage/select_binomo" do
    visit app_host + "/binomo/smoke_binomo"
    expect(current_url).to eq("#{app_host}/binomo/smoke_binomo")
    expect(page.status_code) == 200
  end

  context "find class binomo" do
    before(:each) do
      visit app_host + "/binomo/smoke_binomo"
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
    it "find select driver" do
      expect(page).to have_select('generator_driver', options:["chrome", "firefox"])
    end
    it "find select faramework" do
      expect(page).to have_select('generator_work', options:["cucumber"])
    end
    it "find select stage" do
      expect(page).to have_select('generator_stage', options:%w[s1 s2 s3 s4 s5 s6 s7 prod])
    end
    it "find select locale" do
      expect(page).to have_select('generator_chk_locale', options: %w(ru en id ms es th vn cn pt md ro kr).map(&:upcase))
    end
    it "find select sleep after deposit or cashier" do
      expect(page).to have_select('generator_sleep_retried', options:%w(5 10 15 20 25 30 60))
    end
  end


  context "Not find class binomo" do
    before(:each) do
      visit app_host + "/binomo/smoke_binomo"
    end

    it { expect(page.status_code) == 200  }
    it { expect( find(:css, '#generator_global_ckeckbox_check').value ).to eq('check') }
    it { expect( find(:css, '#generator_scenario_yopmail').value ).to eq('yopmail') }
    it { expect( find(:css, '#generator_scenario_welcome').value ).to eq('welcome') }
    it { expect( find(:css, '#generator_scenario_cashier').value ).to eq('cashier') }
    it { expect( find(:css, '#generator_scenario_ticket').value ).to eq('ticket') }
    it { expect( find(:css, '#generator_scenario_payouts').value ).to eq('payouts') }
    it { expect( find(:css, '#generator_scenario_authorization_crm').value ).to eq('authorization_crm') }
    it { expect( find(:css, '#generator_scenario_manager_crm').value ).to eq('manager_crm') }
    it { expect( find(:css, '#generator_scenario_comment_crm').value ).to eq('comment_crm') }
    it { expect( find(:css, '#generator_scenario_ticket_crm').value ).to eq('ticket_crm') }
    it { expect( find(:css, '#generator_scenario_payments_approve_crm').value ).to eq('payments_approve_crm') }
    it { expect( find(:css, '#generator_scenario_payments_reject_crm').value ).to eq('payments_reject_crm') }
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
    it "find select stage" do
      expect(page).to have_no_select('generator_stage', options:["s1", "s2", "s3", "s4", "prod", "locale"])
    end
    it "find select driver" do
      expect(page).to have_no_select('generator_driver', options:["chrome", "webkit", "firefox", "safari"])
    end
    it "find select faramework" do
      expect(page).to have_no_select('generator_work', options:["rspec", "cucumber"])
    end
    it "find select locale" do
      expect(page).to have_no_select('generator_chk_locale', options:["ru", "en", "id", "ms", "es","th", "vn"])
    end
    it "find select sleep after deposit or cashier" do
      expect(page).to have_no_select('generator_sleep_retried', options:["5", "10", "15", "20", "25","30", "60"])
    end
  end
end
