require "spec_helper"
require "rails_helper"

RSpec.describe "Capybara" , type: :view do
  app_host = "http://localhost:3000"
  context "find class binomo" do
    before do
      visit app_host + "/binpartner/smoke_binpartner"
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
      expect(page).to have_select('generator_driver', options:["chrome", "webkit", "firefox", "safari"])
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

  context "Not find class binomo" do
    before(:each) do
      visit app_host + "/binpartner/smoke_binpartner"
    end

    it { expect(page.status_code) == 200  }
    it { expect( find(:css, '#generator_scenario_create_postback').value ).to eq('create_postback') }
    it { expect( find(:css, '#generator_scenario_cpl_soi').value ).to eq('CPL SOI') }
    it { expect( find(:css, '#generator_scenario_cpl_doi').value ).to eq('CPL DOI') }
    it { expect( find(:css, '#generator_scenario_cpa_').value ).to eq('CPA %') }
    it { expect( find(:css, '#generator_scenario_cpa').value ).to eq('CPA') }
    it { expect( find(:css, '#generator_scenario_ftd_1').value ).to eq('FTD 1') }
    it { expect( find(:css, '#generator_scenario_ftd_2').value ).to eq('FTD 2') }
    it { expect( find(:css, '#generator_scenario_receive_promo_code').value ).to eq('receive_promo_code') }
    it { expect( find(:css, '#generator_scenario_registration_partner').value ).to eq('registration_partner') }
    it { expect(page).to have_selector "#generator_scenario_registration_partner", visible: true }
    it { expect( find(:css, '#generator_global_ckeckbox_check').value ).to eq('check') }
  end

  context 'visit page trader_new' do
    before(:each) do
      visit app_host + "/binpartner/trader_for_partner"
    end

    it { expect( find(:css, '#generator_scenario_reg_treder_refcode').value ).to eq('reg_treder_refcode') }
    it { expect( find(:css, '#generator_scenario_authorization').value ).to eq('authorization') }
    it { expect( find(:css, '#generator_scenario_payouts').value ).to eq('payouts') }
    it { expect( find(:css, '#generator_scenario_payments_approve_crm').value ).to eq('payments_approve_crm') }
    it { expect( find(:css, '#generator_scenario_authorization_crm').value ).to eq('authorization_crm') }
    it { expect( find(:css, '#generator_scenario_welcome').value ).to eq('welcome') }
    it { expect( find(:css, '#generator_scenario_cashier').value ).to eq('cashier') }
    it { expect( find(:css, '#generator_scenario_yopmail').value ).to eq('yopmail') }
    it { expect( find(:css, '#generator_scenario_confirmed').value ).to eq('confirmed') }
  end

  context 'visit page trader_new' do
    before(:each) do
      visit app_host + "/homepage/status_code_pages"
    end
    it { expect( find(:css, '#generator_scenario_status_code_page_partner').value ).to eq('status code page partner') }
    it { expect( find(:css, '#generator_scenario_status_code_page_binomo').value ).to eq('status code page binomo') }


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
      expect(page).to have_no_select('generator_chk_locale', options:["ru", "en", "id", "ms", "es","th","vn","zw"])
    end
    it "find select sleep after deposit or cashier" do
      expect(page).to have_no_select('generator_sleep_retried', options:["5", "10", "15", "20", "25","30", "60"])
    end
  end
end
