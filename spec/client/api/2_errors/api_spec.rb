require "rails_helper"

RSpec.describe "Api errors validations" do
   let!(:err_success) {{ err_success: {"success"=>false, "data"=>nil, "errors"=>[{"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"}]} }}
   let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ]  }}

   context "params" do
     it { expect( Api.new.get_api('web', 'ru')['success']).to eq false }
     it { expect( Api.new.get_api('we', 'u',)['errors']).to eq err_blank[:err_blank] }
     it { expect( Api.new.get_api('', '',)).to eq  err_success[:err_success] }
     it { expect( Api.new.get_api('web', 'ru',)['errors']).to eq err_blank[:err_blank] }
     it { expect( Api.new.get_api('', 'ru',)['errors']).to eq  err_blank[:err_blank] }
     it { expect( Api.new.get_api('web', '',)['errors']).to eq  err_blank[:err_blank] }
   end
end
