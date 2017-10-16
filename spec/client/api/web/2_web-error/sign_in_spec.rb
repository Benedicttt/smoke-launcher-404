require "rails_helper"

RSpec.describe "Authorize errors validations" do
  context "params" do
   it { expect( Authorized.new.get_auth('sb', 'ru',  '', '')['errors']).to eq device }
   it { expect( Authorized.new.get_auth('', 'ru',  '', '')['errors']).to eq device }
   it { expect( Authorized.new.get_auth('s', 'r',  '', '')['errors']).to eq locale }
   it { expect( Authorized.new.get_auth('web', 'r',  '', '')['errors']).to eq locale }
   it { expect( Authorized.new.get_auth('web', '', '', '')['errors']).to eq blank }
   it { expect( Authorized.new.get_auth('web', 'ru', '', '')['errors']).to eq wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru', '1', '')['errors']).to eq  wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru', '.', '')['errors']).to eq  wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru', '[]', '')['errors']).to eq  wrong_credentials }
   it { expect( Authorized.new.get_auth('web', 'ru', ']', '')['errors']).to eq  wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru', '!@#$%^&*()_+]','')['errors']).to eq wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru','12345q','')['errors']).to eq  wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru','12345', 'email@yopmail.com')['success']).to eq false }
   it { expect( Authorized.new.get_auth('web', 'ru','12345q', '')['errors']).to eq  wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru','12345q', 'email@rehfuh')['errors']).to eq  wrong_credentials}
   it { expect( Authorized.new.get_auth('web', 'ru','12345q', '@yopmail.com')['errors']).to eq  wrong_credentials}
 end
end
