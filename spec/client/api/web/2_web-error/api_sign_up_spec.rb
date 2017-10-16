require "rails_helper"

RSpec.describe "Registration errors validations" do
   context "params" do
     it { expect( Reg.new.post_sign_up('sb', 'ru', '', '', '', false)[0]['errors']).to eq device }
     it { expect( Reg.new.post_sign_up('web', 'r', '', '', '', false)[0]['errors']).to eq locale }
     it { expect( Reg.new.post_sign_up('web', '', '', '', '', false)[0]['errors']).to eq blank }
     it { expect( Reg.new.post_sign_up('web', 'ru', '', '', '', false)[0]['errors']).to eq pass_blank + email_empty + agree }
     it { expect( Reg.new.post_sign_up('web', 'ru', '1', '', '', false)[0]['errors']).to eq pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up('web', 'ru', '.', '', '', false)[0]['errors']).to eq pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up('web', 'ru', '[]', '', '', false)[0]['errors']).to eq pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up('web', 'ru', ']', '', '', false)[0]['errors']).to eq pass_length + email_empty + agree }
     it { expect( Reg.new.post_sign_up('web', 'ru', '!@#$%^&*()_+]', '', '', false)[0]['errors']).to eq pass_symbol + email_empty + agree }
     it { expect( Reg.new.post_sign_up('web', 'ru','12345q', '', '', false)[0]['errors']).to eq email_empty + agree  }
     it { expect( Reg.new.post_sign_up('web', 'ru','12345q', 'ss', 'email@yopmail.com', false)[0]['errors']).to eq email_created }
     it { expect( Reg.new.post_sign_up('web', 'ru','12345q', 'huj', '', false)[0]['errors']).to eq email_empty }
     it { expect( Reg.new.post_sign_up('web', 'ru','12345q', '', 'email@rehfuh', false)[0]['errors']).to eq email_invalid + agree }
     it { expect( Reg.new.post_sign_up('web', 'ru','12345q', '', '@yopmail.com', false)[0]['errors']).to eq email_invalid + agree }
   end
end
