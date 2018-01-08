
require "rubygems"
require "json"
require 'rest_client'
require 'rspec'

include RSpec

  def exchange_transfers(email, password, api_key, from_uuid, to_uuid, amount_currency, amount)
    url = "https://sandbox.cryptopay.me/api/v2/exchange_transfers"
    response = RestClient::Request.execute(
      method: :post,
      url: url,
        headers: {
          content_type: "application/x-www-form-urlencoded",
        params: {
          locale: "ru",
          device: "web",
          api_key: api_key,
          email: email,
          password: password,
          amount: amount,
          amount_currency: amount_currency,
          from_account: from_uuid,
          to_account: to_uuid
        }
      }) { |response, request| response }

      return JSON.parse(response.body)
  end


  api_key  = "acea9d6d570540bb7d0e0f077182ffdc"
  email    = "qaguard0001@mailinator.com"
  password = "g3tt3stsd0ne"

  BTC      = "c5c8737f-6e13-4b5a-9ef3-285f49bc05b7"
  USD      = "d96d23be-30c9-4243-a9ab-e432e9a6f71d"
  EUR      = "95b22bb7-1bee-4bc5-9555-52689137eb49"
  GBP      = "47d56f1f-9db1-4421-8ba9-804558d2106e"

  transfer_respons = exchange_transfers(email, password, api_key, BTC, USD, "BTC", 1)
  transfer_respons.each do |key, value|
    puts "#{key.class} - #{value.class}"
    
  end
