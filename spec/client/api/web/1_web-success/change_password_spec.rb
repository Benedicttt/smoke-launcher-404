RSpec.describe "Remind and Change password" do
  before(:all) do
    @change = Password.new.remind('web', 'ru')
    @link_new_password = Password.new.change('web', 'ru')
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
