require "spec_helper"
require "rails_helper"

RSpec.describe "Capybara" , type: :view do
  app_host = "http://localhost:3001"

  context "find class api_request" do
    before(:each) do
      visit app_host + "/homepage/api_request"
    end
    it { expect(page.status_code) == 200 }

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
      expect(page).to  have_selector('.reload-page')
    end
        it "find select driver" do
      expect(page).to have_select('generator_driver', options:["chrome", "firefox"])
    end
    it "find select faramework" do
      expect(page).to have_select('generator_work', options:["cucumber"])
    end
    it "find select stage" do
      expect(page).to have_select('generator_stage', options: %w[s1 s2 s3 s4 s5 s6 s7 prod] )
    end
    it "find select locale" do
      expect(page).to have_select('generator_chk_locale', options: %w(ru en id ms es th vn cn pt md ro kr).map(&:upcase))
    end
    it "find select sleep after deposit or cashier" do
      expect(page).to have_select('generator_sleep_retried', options:%w(5 10 15 20 25 30 60))
    end
  end
end
