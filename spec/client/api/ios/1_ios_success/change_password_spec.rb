RSpec.describe "Remind and Change password" do
  before(:all) do
    @change = PasswordApp.new.remind('web', 'ru', $uuid, "1,0", )
    @link_new_password = PasswordApp.new.change('web', 'ru', $uuid, "1,0", Cookies.where(stage: ENV['stage']).last.authtoken)
  end

  context "response" do
    it { expect(@change['success']).to eq true }
    it { expect(@change['errors']).to eq [] }
    it { expect(@change['data']['text']).to eq "На почту выслана ссылка для изменения пароля" }

    it { expect(@link_new_password['success']).to eq true }
    it { expect(@link_new_password['errors']).to eq [] }
    it { expect(@link_new_password['data']['text']).to eq "Пароль успешно изменен" }
  end
end
