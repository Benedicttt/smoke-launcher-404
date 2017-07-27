require 'rails_helper'

RSpec.describe "get admin partner pages" do
  context "Crm part 1" do
    $link_binpartner_adm_200.each_line do |link|
      it "get url #{link}" do
      url = "https://#{ENV['stage'].sub('.', '')}-adm.binpartner.com/#{link}"
        safeurl = URI.encode(url.strip)

        response = RestClient.get(
        safeurl,
         cookies: {
           :_binpartner_session => "cFZVUE9GaWxjQkx4WmFPbloyTWFtQmxiUjUvU3A0SGlLd3B1b1l2emVhNUxVc0xMM2xxY1hnVG9JQXZHdENiYXk4VFdUVGpHOXBnWHB3NlZTUW01Wm1tdUthUlhvSS9Bb3NiMXZjQzAyVzc1NkdjR240am5heWlSZDVncVdGTDN3b1RpWXU3SzVjZnFmbUhXT2VZVnBBPT0tLWZUcW9WaTdhbm1acGFBY29mQUY5anc9PQ%3D%3D--00364fe74a10997faca97b5e8922bd9c86cbb9f2",
           :user_id => "Mg%3D%3D--93f1ebbc01a1356c110cf0c09775ce51783e886c"
         })
         expect(response.code).to eq(200)
      end
    end
  end

  context "get platform partner no auth" do
    $link_noauth_platform_binpartner_200.each_line do |link|
      it "get url #{link}" do
        url = "https://#{ENV['stage'].sub('.', '')}.binpartner.com/ru/#{link}"
        safeurl = URI.encode(url.strip)
        response= RestClient.get(safeurl)
         sleep 0.1
         expect(response.code).to eq(200)
       end
     end
  end

  context "get platform partner auth" do
    $link_auth_platform_binpartner_200.each_line do |link|
      it "get url #{link}" do
        url = "https://#{ENV['stage'].sub('.', '')}.binpartner.com/ru/#{link}"
        safeurl = URI.encode(url.strip)
        response= RestClient.get(safeurl, cookies: Partner.last.cookies)
         sleep 0.1
         expect(response.code).to eq(200)
       end
     end
    end
end
