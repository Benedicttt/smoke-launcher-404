require 'rails_helper'

RSpec.describe "join session" do
  before(:context) do
     tournaments = Tournaments.new.api("ru", "web")
     ids = []
     ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['name'].split[0] == "ru" }
     @id_max = 319
     # @id_max = ids[0].compact.max
     print "#{@id_max} ".yellow

     ws          = RequestWS.new
     stage       = ENV['stage']

     expire_at  = (Time.now.to_i / 60).to_i * 60
     expire_at += Time.now.sec > 10 ? 2.minutes : 1.minutes

     @won =  ws.send_ws "web", false, "GOL/OTC", expire_at, 100,  "turbo", "tournament", "put", 1, @id_max, stage, "2"
     sleep 1
     @lose =  ws.send_ws "web", false, "GOL/OTC", expire_at, 100,  "turbo", "tournament", "call", 1, @id_max, stage, "3"
     sleep 1
     @deals_lose = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][0] #lose
     @deals_won = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][1] #won
     sleep 1

     print "#{(Time.parse(@deals_won['finished_at']) - Time.parse(@deals_won['created_at'])).to_i}".green
     sleep (Time.parse(@deals_won['finished_at']) - Time.parse(@deals_won['created_at'])).to_i + 5

     null = "l"
     @msg_ws_deal = JSON.parse(eval($msg_deals).to_json)


     put = []
     call = []
     $deal_list_tour['data'].each_with_index { |value, num| @parses = JSON.parse(value[num].to_json);  }
     @parses.map { |deals| put << deals if deals['status'] == 'won' && deals['trend'] == 'put' }.compact
     @parses.map { |deals| call << deals if deals['status'] == 'lost' && deals['trend'] == 'call' }.compact

     @put = put[0]
     @call = call[0]
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
    it { expect(@put['id']).to be_a Integer }
    it { expect(@put['asset']).to eq "GOL/OTC" }
    it { expect(@put['name']).to eq "FOR/HEIGHT" }
    it { expect(@put['trend']).to eq "put" }

    it { expect(@put['entrie_rate']).to be_a Float }
    it { expect(@put['bet']).to eq 100 }
    it { expect(@put['payment']).to be_a Float }
    it { expect(@put['payment']).to eq "#{ 100 + Assets.new.get('web', 'ru')[1][0] }.0".to_f - 1 }
    it { expect(@put['status']).to eq "won"  }
    it { expect(@put['option_type']).to eq "turbo" }
    it { expect(@put['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0]}.0}".to_f - 1 }
    it { expect(@put['demo']).to eq false }
    it { expect(@put['deal_type']).to eq "tournament" }
    it { expect(@put['tournament_id']).to eq @id_max }
    it { expect(@put['end_rate']).to be_a Float }
    it { expect(@put['win']).to eq 100 + Assets.new.get('web', 'ru')[1][0] - 1 }
  end

  context "params close PUT deal" do
    it { expect( @call['id']).to be_a Integer }
    it { expect( @call['asset']).to eq "GOL/OTC" }
    it { expect( @call['name']).to eq "FOR/HEIGHT" }
    it { expect( @call['trend']).to eq "call" }

    it { expect( @call['entrie_rate']).to be_a Float }
    it { expect( @call['bet']).to eq 100 }
    it { expect( @call['payment']).to be_a Float }
    it { expect( @call['payment']).to eq "#{ 100 + Assets.new.get('web', 'ru')[1][0] }.0".to_f - 1 }
    it { expect( @call['status']).to eq "lost"  }
    it { expect( @call['option_type']).to eq "turbo"  }
    it { expect( @call['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0] }.0}".to_f - 1 }
    it { expect( @call['demo']).to eq false }
    it { expect( @call['deal_type']).to eq "tournament" }
    it { expect( @call['tournament_id']).to eq @id_max }
    it { expect( @call['end_rate']).to be_a Float }
    it { expect( @call['win']).to eq 0 }
  end
end
