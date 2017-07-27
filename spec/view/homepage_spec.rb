require 'spec_helper'
require 'rails_helper'

RSpec.describe HomepageController, type: :view do
  app_host = "http://localhost:3000"

  describe "/homepage.html.slim" do
    before do
      visit app_host + "/homepage"
    end

    it { expect(page.status_code) == 200  }
    context 'binomo' do
      it { expect( find(:css, '.platform-binomo').text).to eq('binomo')}
      it { expect(page).to have_content("binomo") }
      it { expect(page).to have_link('binomo', href: '/homepage/select_binomo', visible: true) }
    end

    context 'binpartner' do
      it { expect( find(:css, '.platform-binpartner').text).to eq('binpartner')}
      it { expect(page).to have_content("binpartner") }
      it { expect(page).to have_link('binpartner', href: '/homepage/select_binpartner', visible: true) }
    end

    context 'app_request' do
      it { expect( find(:css, '.platform-request').text).to eq('api request')}
      it { expect(page).to have_content("api request") }
      it { expect(page).to have_link('api request', href: '/homepage/api_request', visible: true) }
    end

    context 'need_link' do
      it { expect( first(:css, '.need_link').text).to eq('need link?')}
      it { expect(page).to have_content("need link?") }
      it { expect(page).to have_link('need link?', href: '/homepage/need_link', visible: true) }
    end
  end

  describe "/select.html.slim negative" do
    before do
      visit app_host + "/homepage/select_binomo"
    end

    context 'binonomo select page' do
      it { expect( page.all(:css, '.smoke-binomo')[0].text).to eq('smoke test binomo')}
      it { expect(page).to have_content("smoke test binomo") }
      it { expect(page).to have_link('smoke test binomo', href: '/binomo/smoke_binomo', visible: true) }
    end

    context 'binonomo select page' do
      it { expect( page.all(:css, '.smoke-binomo')[1].text).to eq('landings redirect')}
      it { expect(page).to have_content("landings redirect") }
      it { expect(page).to have_link('landings redirect', href: '/binomo/smoke_prod', visible: true) }
    end

    context 'binonomo select page' do
      it { expect( page.all(:css, '.smoke-binomo')[2].text).to eq('recovery password')}
      it { expect(page).to have_content("recovery password") }
      it { expect(page).to have_link('recovery password', href: '/binomo/recovery_password', visible: true) }
    end

    context 'binonomo select page' do
      it { expect( page.all(:css, '.smoke-binomo')[3].text).to eq('push notifications')}
      it { expect(page).to have_content("push notifications") }
      it { expect(page).to have_link('push notifications', href: '/binomo/push_notify', visible: true) }
    end

    context 'binonomo select page' do
      it { expect( page.all(:css, '.smoke-binomo')[4].text).to eq('email marketing')}
      it { expect(page).to have_content("email marketing") }
      it { expect(page).to have_link('email marketing', href: '/binomo/email_marketing', visible: true) }
    end

  end

  # describe "/homepage.html.slim negative" do
  #   app_host = "http://localhost:3000"
  #
  #   before(:context) do
  #     visit app_host + "/404"
  #   end
  #
  #   it { page.status_code.should == 200 }
  #   context 'binomo' do
  #     it { expect(page).to have_no_content("binomo") }
  #     it { expect(page).to have_no_link('binomo', href: '/binomo', visible: true) }
  #   end
    #
    # context 'binpartner' do
    #   it { expect(page).to have_no_content("binpartner") }
    #   it { expect(page).to have_no_link('binpartner', href: '/binpartner', visible: true) }
    # end
    #
    # context 'app_request' do
    #   it { expect(page).to have_no_content("api request") }
    #   it { expect(page).to have_no_link('api request', href: '/api_request', visible: true) }
    # end
    #
    # context 'need_link' do
    #   it { expect(page).to have_no_content("need link?") }
    #   it { expect(page).to have_no_link('need link?', href: '/need_link', visible: true) }
    # end

  # end
end
