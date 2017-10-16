require "rails_helper"

RSpec.describe "Registration errors validations v2" do
   context "params" do
     it { expect( Reg.new.post_sign_up_v2('sb', 'ru', '', '', '')[0]['errors']).to eq device }
     it { expect( Reg.new.post_sign_up_v2('web', 'r', '', '', '')[0]['errors']).to eq locale }
     it { expect( Reg.new.post_sign_up_v2('web', '', '', '', '')[0]['errors']).to eq blank }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '', '', '')[0]['errors']).to eq pass_blank + email_empty + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '1', '', '')[0]['errors']).to eq  pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '.', '', '')[0]['errors']).to eq  pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '[]', '', '')[0]['errors']).to eq  pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', ']', '', '')[0]['errors']).to eq  pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru', '!@#$%^&*()_+]', '', '')[0]['errors']).to eq  pass_symbol + email_empty + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', '', '')[0]['errors']).to eq  email_empty + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', 'ss', 'email@yopmail.com')[0]['errors']).to eq  email_created }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', 'huj', '')[0]['errors']).to eq  email_empty }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', '', 'email@rehfuh')[0]['errors']).to eq  email_invalid + agree }
     it { expect( Reg.new.post_sign_up_v2('web', 'ru','12345q', '', '@yopmail.com')[0]['errors']).to eq  email_invalid + agree}
   end
end
