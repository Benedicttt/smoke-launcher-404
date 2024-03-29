require 'rails_helper'

RSpec.describe "Deals success turbo" do
  before(:context) do
    @expired = (Time.now.to_i / 60).to_i*60
    @expired += Time.now.sec > 15 ? 2.minutes : 1.minutes
    @deals_demo = Deals.new.demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, @expired, 'ru', 'web')
    sleep 1
  end

  context "params" do
    it { expect(@deals_demo[0]['success']).to eq true }
    it { expect(@deals_demo[0]['data']["id"]).to be_a(Integer) }
    it { expect(@deals_demo[0]['data']["status"]).to eq "pending" }
    it { expect(@deals_demo[0]['data']["errors"]).to eq nil }
    #
    it { expect(@deals_demo[1]["success"]).to eq true }
    it { expect(@deals_demo[1]["data"]['total']).to eq 1 }
    it { expect(@deals_demo[1]["data"]['deals'][0]['id']).to be_a(Integer)  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['asset']).to eq Assets.new.get('web', 'ru')[3][0] }
    it { expect(@deals_demo[1]["data"]['deals'][0]['ric']).to eq Assets.new.get('web', 'ru')[3][0] }
    it { expect(@deals_demo[1]["data"]['deals'][0]['name']).to eq "FOR/HEIGHT" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['trend']).to eq "call" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['entrie_rate']).to be_a(Float)  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['bet']).to eq 1000  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['payment']).to eq "#{1000 + Assets.new.get('web', 'ru')[1][0]*10}.0".to_f }
    it { expect(@deals_demo[1]["data"]['deals'][0]['status']).to eq "open" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['option_type']).to eq "turbo"  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['payment_rate']).to eq Assets.new.get('web', 'ru')[1][0] }
    it { expect(@deals_demo[1]["data"]['deals'][0]['demo']).to eq true }
    it { expect(@deals_demo[1]["data"]['deals'][0]['end_rate']).to eq 0.0 }
    it { expect(@deals_demo[1]["data"]['deals'][0]['win']).to eq 0 }
    it { expect(@deals_demo[1]["data"]['errors']).to eq nil }
  end
end

RSpec.describe "Deals success turbo" do
  before(:context) do
    @expired = (Time.now.to_i / 60).to_i*60
    @expired += Time.now.sec < 30 ? 8.minutes : 7.minutes
    @deals_demo = Deals.new.demo_create(true, "1000", "GOL/OTC", "binary", "call", "mouse", Time.now.to_i, @expired, 'ru', 'web')
    sleep 1
  end

  context "params" do
    it { expect(@deals_demo[0]['success']).to eq true }
    it { expect(@deals_demo[0]['data']["id"]).to be_a(Integer) }
    it { expect(@deals_demo[0]['data']["status"]).to eq "pending" }
    it { expect(@deals_demo[0]['data']["errors"]).to eq nil }

    it { expect(@deals_demo[1]["success"]).to eq true }
    it { expect(@deals_demo[1]["data"]['total']).to eq 2 }
    it { expect(@deals_demo[1]["data"]['deals'][0]['id']).to be_a(Integer)  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['asset']).to eq "GOL/OTC" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['ric']).to eq "GOL/OTC" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['name']).to eq "FOR/HEIGHT" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['trend']).to eq "call" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['entrie_rate']).to be_a(Float)  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['bet']).to eq 1000  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['payment']).to eq "#{1000 + Assets.new.get('web', 'ru')[2][0]*10}.0".to_f }
    it { expect(@deals_demo[1]["data"]['deals'][0]['status']).to eq "open" }
    it { expect(@deals_demo[1]["data"]['deals'][0]['option_type']).to eq "binary"  }
    it { expect(@deals_demo[1]["data"]['deals'][0]['payment_rate']).to eq Assets.new.get('web', 'ru')[2][0] }
    it { expect(@deals_demo[1]["data"]['deals'][0]['demo']).to eq true }
    it { expect(@deals_demo[1]["data"]['deals'][0]['end_rate']).to eq 0.0 }
    it { expect(@deals_demo[1]["data"]['deals'][0]['win']).to eq 0 }
    it { expect(@deals_demo[1]["data"]['errors']).to eq nil }

  end
end
