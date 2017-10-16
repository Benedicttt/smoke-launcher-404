require "rails_helper"

RSpec.describe "Api errors validations" do

   context "params" do
     it { expect( Api.new.get_api("web", "ru")["success"]).to eq false }
     it { expect( Api.new.get_api("we", "u")["errors"]).to eq blank }
     it { expect( Api.new.get_api("", "")["errors"]).to eq  blank }
     it { expect( Api.new.get_api("web", "ru")["errors"]).to eq blank }
     it { expect( Api.new.get_api("", "ru")["errors"]).to eq blank }
     it { expect( Api.new.get_api("web", "")["errors"]).to eq  blank }
   end
end
