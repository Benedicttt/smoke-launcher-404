require "rails_helper"

RSpec.describe "RegAppistration errors validations" do
   context "params" do
     it { expect( RegApp.new.post_sign_up('sb', 'ru', '', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq device }
     it { expect( RegApp.new.post_sign_up('ios', 'r', '', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq locale }
     it { expect( RegApp.new.post_sign_up('ios', '', '', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq blank }
     it { expect( RegApp.new.post_sign_up('ios', 'ru', '', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq pass_blank + email + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru', '1', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq pass_length + email + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru', '.', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq pass_length + email + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru', '[]', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq pass_length + email + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru', ']', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq pass_length + email + agree  }
     it { expect( RegApp.new.post_sign_up('ios', 'ru', '!@#$%^&*()_+]', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq pass_symbol + email + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru','12345q', '', '', false, SecureRandom.uuid, '')[0]['errors']).to eq  email + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru','12345q', 'ss', 'email@yopmail.com', false, SecureRandom.uuid, '')[0]['errors']).to eq email_created }
     it { expect( RegApp.new.post_sign_up('ios', 'ru','12345q', 'huj', '', false, SecureRandom.uuid, '')[0]['errors']).to eq email_empty }
     it { expect( RegApp.new.post_sign_up('ios', 'ru','12345q', '', 'email@rehfuh', false, SecureRandom.uuid, '')[0]['errors']).to eq email_invalid + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru','12345q', '', '@yopmail.com', false, SecureRandom.uuid, '')[0]['errors']).to eq email_invalid + agree }
     it { expect( RegApp.new.post_sign_up('ios', 'ru','12345q', '', '@yopmail.com', false, 'dsadsa', '')[0]['errors']).to eq device }
     it { expect( RegApp.new.post_sign_up('ios', 'ru','12345q', '', '@yopmail.com', false, SecureRandom.uuid, '-1')[0]['errors']).to eq email_invalid + agree }
   end
end
