require 'rails_helper'
require 'spec_helper'

RSpec.describe Homepage::NeedLinkController, type: :view do
  app_host = "http://localhost:3001"

  describe "/need_link.html.slim" do
    before do
      visit app_host + "/homepage/need_link"
    end

    context "/need_link.html.slim" do
      it { expect(page.status_code) == 200 }

      it "find arrow image" do
        expect(page).to have_link(nil , href: '/homepage', visible: true)
      end

      it "find reload arrow" do
        expect(page).to have_link(nil, href: '/homepage/need_link', visible: true)
      end
      it { expect(page).to have_css('.prod')}
    end

    context 'binomo' do
      it { expect(page).to have_content("binomo") }
      it { expect(page).to have_content("crm.binomo") }
      it { expect(page).to have_content("profile") }
      it { expect(page).to have_link('binomo', href: 'https://binomo.com', visible: true) }
      it { expect(page).to have_link('crm.binomo', href: 'https://crm.binomo.com', visible: true) }
      it { expect(page).to have_link('profile', href: 'https://binomo.com/api/profile?locale=ru&device=web', visible: true) }
    end

    context 'binpartner' do
      it { expect(page).to have_content("binpartner") }
      it { expect(page).to have_content("adm.binpartner") }
      it { expect(page).to have_link('binpartner', href: 'https://binpartner.com', visible: true) }
      it { expect(page).to have_link('adm.binpartner', href: 'https://adm.binpartner.com', visible: true) }
    end

    context 's1.binomo' do
      it { expect(page).to have_content("s1.binomo") }
      it { expect(page).to have_content("s1.crm.binomo") }
      it { expect(page).to have_content("profile") }
      it { expect(page).to have_link('s1.binomo', href: 'https://s1.binomo.com', visible: true) }
      it { expect(page).to have_link('s1.crm.binomo', href: 'https://s1-crm.binomo.com', visible: true) }
      it { expect(page).to have_link('profile', href: 'https://s1.binomo.com/api/profile?locale=ru&device=web', visible: true) }
    end

    context 's1.binpartner' do
      it { expect(page).to have_content("s1.binpartner") }
      it { expect(page).to have_content("s1.adm.binpartner") }
      it { expect(page).to have_link('s1.binpartner', href: 'https://s1.binpartner.com', visible: true) }
      it { expect(page).to have_link('s1.adm.binpartner', href: 'https://s1-adm.binpartner.com', visible: true) }
    end

    context 's2.binomo' do
      it { expect(page).to have_content("s2.binomo") }
      it { expect(page).to have_content("s2.crm.binomo") }
      it { expect(page).to have_content("profile") }
      it { expect(page).to have_link('s2.binomo', href: 'https://s2.binomo.com', visible: true) }
      it { expect(page).to have_link('crm.binomo', href: 'https://s2-crm.binomo.com', visible: true) }
      it { expect(page).to have_link('profile', href: 'https://s2.binomo.com/api/profile?locale=ru&device=web', visible: true) }
    end

    context 's2.binpartner' do
      it { expect(page).to have_content("s2.binpartner") }
      it { expect(page).to have_content("s2.adm.binpartner") }
      it { expect(page).to have_link('s2.binpartner', href: 'https://s2.binpartner.com', visible: true) }
      it { expect(page).to have_link('s2.adm.binpartner', href: 'https://s2-adm.binpartner.com', visible: true) }
    end

    context 's3.binomo' do
      it { expect(page).to have_content("s3.binomo") }
      it { expect(page).to have_content("s3.crm.binomo") }
      it { expect(page).to have_content("profile") }
      it { expect(page).to have_link('s3.binomo', href: 'https://s3.binomo.com', visible: true) }
      it { expect(page).to have_link('s3.crm.binomo', href: 'https://s3-crm.binomo.com', visible: true) }
      it { expect(page).to have_link('profile', href: 'https://s3.binomo.com/api/profile?locale=ru&device=web', visible: true) }
    end

    context 's3.binpartner' do
      it { expect(page).to have_content("s3.binpartner") }
      it { expect(page).to have_content("s3.adm.binpartner") }
      it { expect(page).to have_link('s3.binpartner', href: 'https://s3.binpartner.com', visible: true) }
      it { expect(page).to have_link('s3.adm.binpartner', href: 'https://s3-adm.binpartner.com', visible: true) }
    end

    context 's4.binomo' do
      it { expect(page).to have_content("s4.binomo") }
      it { expect(page).to have_content("s4.crm.binomo") }
      it { expect(page).to have_content("profile") }
      it { expect(page).to have_link('s4.binomo', href: 'https://s4.binomo.com', visible: true) }
      it { expect(page).to have_link('s4.crm.binomo', href: 'https://s4-crm.binomo.com', visible: true) }
      it { expect(page).to have_link('profile', href: 'https://s4.binomo.com/api/profile?locale=ru&device=web', visible: true) }
    end

    context 's4.binpartner' do
      it { expect(page).to have_content("s4.binpartner") }
      it { expect(page).to have_content("s4.adm.binpartner") }
      it { expect(page).to have_link('s4.binpartner', href: 'https://s4.binpartner.com', visible: true) }
      it { expect(page).to have_link('s4.adm.binpartner', href: 'https://s4-adm.binpartner.com', visible: true) }
    end

    context 'smailers' do
      it { expect(page).to have_content("temp-mail") }
      it { expect(page).to have_content("yopmail") }
      it { expect(page).to have_link('temp-mail', href: 'https://temp-mail.org/', visible: true) }
      it { expect(page).to have_link('yopmail', href: 'http://www.yopmail.com/ru/', visible: true) }
      it { click_link 'binomo'}
    end

  end
end
