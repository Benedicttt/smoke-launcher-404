require 'rails_helper'

class PasswordApp
  def remind(device, locale, device_id, app_version)
    remind = "https://#{ENV['stage']}binomo.com//api/password/remind"
    id = Cookies.where(stage: "#{ENV['stage']}").last.id

    remind = RestClient::Request.execute(
      method: :get,
      url: remind,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params: {
          locale: locale,
          device: device,
          geo: "RU",
          email: Cookies.where(stage: "#{ENV['stage']}").last.email,
          device_id: device_id,
          app_version: app_version
        }
      }) { |response, request, result, &block| response }
     return JSON.parse(remind.body)
  end

  def change(device, locale, device_id, app_version, authtoken)
    id = Cookies.where(stage: ENV['stage']).last.id
    token = (Digest::MD5.hexdigest(id.to_s) + SecureRandom.hex).first(50)
    Runner.call("User.find(#{id.to_s}).update(reset_password_token: '#{token}', password_token_valid_to: '#{(Time.now + 10.days).strftime("%Y-%m-%d %H:%m:%S")}')")

    change_url = "https://#{ENV['stage']}binomo.com/api/password/change"
    change = RestClient::Request.execute(
      method: :post,
      url: change_url,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params: {
          locale: locale,
          token: token,
          password: "12345q",
          password_confirmation: "12345q",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken
        }
      }) { |response, request, result, &block| response }

      api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
      sign_in = RestClient::Request.execute(
        method: :post,
        url: api_sign_in,
        headers: {
          referer: "https://#{ENV['stage']}binomo.com",
          params: {
            locale: locale,
            device: device,
            password: "12345q",
            email: Cookies.where(stage: "#{ENV['stage']}").last.email,
            device_id: device_id,
            app_version: app_version,
            authtoken: authtoken

          }
        }) { |response, request, result, &block| response }
     Cookies.find(Cookies.where(stage: "#{ENV['stage']}").last.id).update(cookies_traider: sign_in.cookies).to_json
     return JSON.parse(change.body)
  end

  def remind_error(device, locale, email, device_id, app_version)
    remind = "https://#{ENV['stage']}binomo.com//api/password/remind"
    id = Cookies.where(stage: "#{ENV['stage']}").last.id
    remind = RestClient::Request.execute(
      method: :get,
      url: remind,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params: {
          locale: locale,
          device: device,
          geo: "RU",
          email: email,
          device_id: device_id,
          app_version: app_version
        }
      }) { |response, request, result, &block| response }
     return JSON.parse(remind.body)
  end

  def change_error(device, locale, token, remind, pass_first, pass_last, device_id, app_version, authtoken)
    if remind == true
      Password.new.remind("web", "ru")
      id = Cookies.where(stage: ENV['stage']).last.id
      token_new = (Digest::MD5.hexdigest(id.to_s) + SecureRandom.hex).first(50)
      Runner.call("User.find(#{id.to_s}).update(reset_password_token: '#{token_new}')")
      Cookies.where(stage: "#{ENV['stage']}").last.update(reset_password_token: token_new)
    end

    remind = "https://#{ENV['stage']}binomo.com/api/password/change"
    change = RestClient::Request.execute(
      method: :post,
      url: remind,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params: {
          locale: locale,
          token: token,
          password: pass_first,
          password_confirmation: pass_last,
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken
        }
      }) { |response, request, result, &block| response }

     return JSON.parse(change.body)
  end
end
