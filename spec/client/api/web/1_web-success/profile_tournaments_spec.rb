RSpec.describe "Change_password_profile" do
  before(:all) do
    @tour2 = Tournaments.new.list("web", "ru", '12345q', Cookies.where(stage: "#{ENV['stage']}").last.email)
    @tour2 = Tournaments.new.list("web", "ru", '', '')
  end
  # it {  puts @tour2; puts }
  # it {  puts @tour3; puts }
end
