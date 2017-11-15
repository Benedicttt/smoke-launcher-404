require 'rails_helper'

RSpec.describe "join session" do
  before(:context) do
     tournaments = Tournaments.new.api("ru", "web")
     ids = []
     ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['name'].split[0] == "ru" }
     @id_max = ids[0].compact.max
     print "#{@id_max} ".yellow

     ws          = RequestWS.new
     stage       = ENV['stage']

     expire_at  = (Time.now.to_i / 60).to_i * 60
     expire_at += Time.now.sec > 10 ? 2.minutes : 1.minutes
     #
     @won =  ws.send_ws "web", false, "GOL/OTC", expire_at, 100,  "turbo", "tournament", "put", 1, @id_max, stage, "2"
     sleep 1
     @lose =  ws.send_ws "web", false, "GOL/OTC", expire_at, 100,  "turbo", "tournament", "call", 1, @id_max, stage, "3"

     @deals_won = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][1] #won
     sleep 0.5
     @deals_lose = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][0] #lose

     print "#{(Time.parse(@deals_won['finished_at']) - Time.parse(@deals_won['created_at'])).to_i}".green
     sleep (Time.parse(@deals_won['finished_at']) - Time.parse(@deals_won['created_at'])).to_i + 5

     @closed_lose_deal_data = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][1]
     @closed_won_deal_data = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][0]
     sleep 1
     null = "l"
     @msg_ws_deal = JSON.parse(eval($msg_deals).to_json)
  end

  context "param create deal" do
    it { expect(@msg_ws_deal['topic']).to eq "base" }
    it { expect(@msg_ws_deal['payload']['trend']).to eq "call" }
    it { expect(@msg_ws_deal['payload']['tournament_id']).to eq @id_max }
    it { expect(@msg_ws_deal['payload']['status']).to eq "open" }
    it { expect(@msg_ws_deal['payload']['bet']).to eq 100 }
    it { expect(@msg_ws_deal['payload']['payment']).to be_a Float }
    it { expect(@msg_ws_deal['payload']['payment']).to eq "#{ 100 + Assets.new.get('web', 'ru')[1][0] }.0".to_f - 1 }
    it { expect(@msg_ws_deal['payload']['status']).to eq "open"  }
    it { expect(@msg_ws_deal['payload']['option_type']).to eq "turbo"  }
    it { expect(@msg_ws_deal['payload']['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0]}.0}".to_f - 1 }

    it { expect(@msg_ws_deal['payload']['id']).to be_a Integer }
    it { expect(@msg_ws_deal['payload']['name']).to eq "FOR/HEIGHT" }

    it { expect(@msg_ws_deal['payload']['entrie_rate']).to be_a Float }
    it { expect(@msg_ws_deal['payload']['demo']).to eq false }
    it { expect(@msg_ws_deal['payload']['deal_type']).to eq "tournament" }
    it { expect(@msg_ws_deal['event']).to eq "create_deal" }
  end

  context "params open PUT deal" do
    it { expect(@deals_won['id']).to be_a Integer }
    it { expect(@deals_won['asset']).to eq "GOL/OTC" }
    it { expect(@deals_won['name']).to eq "FOR/HEIGHT" }
    it { expect(@deals_won['trend']).to eq "put" }

    it { expect(@deals_won['entrie_rate']).to be_a Float }
    it { expect(@deals_won['bet']).to eq 100 }
    it { expect(@deals_won['payment']).to be_a Float }
    it { expect(@deals_won['payment']).to eq "#{ 100 + Assets.new.get('web', 'ru')[1][0] }.0".to_f - 1 }
    it { expect(@deals_won['status']).to eq "open"  }
    it { expect(@deals_won['option_type']).to eq "turbo" }
    it { expect(@deals_won['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0]}.0}".to_f - 1 }
    it { expect(@deals_won['demo']).to eq false}
    it { expect(@deals_won['deal_type']).to eq "tournament" }
    it { expect(@deals_won['tournament_id']).to eq @id_max}
    it { expect(@deals_won['end_rate']).to eq 0.0}
    it { expect(@deals_won['win']).to eq 0 }
  end

  context "params open CALL deal" do
    it { expect(@deals_lose['id']).to be_a Integer }
    it { expect(@deals_lose['asset']).to eq "GOL/OTC" }
    it { expect(@deals_lose['name']).to eq "FOR/HEIGHT" }
    it { expect(@deals_lose['trend']).to eq "call" }

    it { expect(@deals_lose['entrie_rate']).to be_a Float }
    it { expect(@deals_lose['bet']).to eq 100 }
    it { expect(@deals_lose['payment']).to be_a Float }
    it { expect(@deals_lose['payment']).to eq "#{ 100 + Assets.new.get('web', 'ru')[1][0] }.0".to_f - 1 }
    it { expect(@deals_lose['status']).to eq "open"  }
    it { expect(@deals_lose['option_type']).to eq "turbo" }
    it { expect(@deals_lose['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0]}.0}".to_f - 1 }
    it { expect(@deals_lose['demo']).to eq false }
    it { expect(@deals_lose['deal_type']).to eq "tournament" }
    it { expect(@deals_lose['tournament_id']).to eq @id_max }
    it { expect(@deals_lose['end_rate']).to eq 0.0 }
    it { expect(@deals_lose['win']).to eq 0 }
  end

  context "params close CALL deal" do
    it { expect(@closed_won_deal_data['id']).to be_a Integer }
    it { expect(@closed_won_deal_data['asset']).to eq "GOL/OTC" }
    it { expect(@closed_won_deal_data['name']).to eq "FOR/HEIGHT" }
    it { expect(@closed_won_deal_data['trend']).to eq "call" }

    it { expect(@closed_won_deal_data['entrie_rate']).to be_a Float }
    it { expect(@closed_won_deal_data['bet']).to eq 100 }
    it { expect(@closed_won_deal_data['payment']).to be_a Float }
    it { expect(@closed_won_deal_data['payment']).to eq "#{ 100 + Assets.new.get('web', 'ru')[1][0] }.0".to_f - 1 }
    it { expect(@closed_won_deal_data['status']).to eq "lost"  }
    it { expect(@closed_won_deal_data['option_type']).to eq "turbo" }
    it { expect(@closed_won_deal_data['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0]}.0}".to_f - 1 }
    it { expect(@closed_won_deal_data['demo']).to eq false }
    it { expect(@closed_won_deal_data['deal_type']).to eq "tournament" }
    it { expect(@closed_won_deal_data['tournament_id']).to eq @id_max }
    it { expect(@closed_won_deal_data['end_rate']).to be_a Float }
    it { expect(@closed_won_deal_data['win']).to eq 0 }
  end

  context "params close PUT deal" do
    it { expect( @closed_lose_deal_data['id']).to be_a Integer }
    it { expect( @closed_lose_deal_data['asset']).to eq "GOL/OTC" }
    it { expect( @closed_lose_deal_data['name']).to eq "FOR/HEIGHT" }
    it { expect( @closed_lose_deal_data['trend']).to eq "put" }

    it { expect( @closed_lose_deal_data['entrie_rate']).to be_a Float }
    it { expect( @closed_lose_deal_data['bet']).to eq 100 }
    it { expect( @closed_lose_deal_data['payment']).to be_a Float }
    it { expect( @closed_lose_deal_data['payment']).to eq "#{ 100 + Assets.new.get('web', 'ru')[1][0] }.0".to_f - 1 }
    it { expect( @closed_lose_deal_data['status']).to eq "won"  }
    it { expect( @closed_lose_deal_data['option_type']).to eq "turbo"  }
    it { expect( @closed_lose_deal_data['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0] }.0}".to_f - 1 }
    it { expect( @closed_lose_deal_data['demo']).to eq false }
    it { expect( @closed_lose_deal_data['deal_type']).to eq "tournament" }
    it { expect( @closed_lose_deal_data['tournament_id']).to eq @id_max }
    it { expect( @closed_lose_deal_data['end_rate']).to be_a Float }
    it { expect( @closed_lose_deal_data['win']).to eq 100 + Assets.new.get('web', 'ru')[1][0] - 1 }
  end
end
