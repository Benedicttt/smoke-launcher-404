module PartnersSmoke
  class Admin
    def self.authorize
        DRIVER.get CommonSetting[:url_adm_partner]
        sleep 1
        if DRIVER.current_url === CommonSetting[:url_adm_partner] + "login"
          DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]["login"])
          DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]["password"])
          DRIVER.find_element(:css, ".btn.btn-primary").click
        end
    end
  end
end
