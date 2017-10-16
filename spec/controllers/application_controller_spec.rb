RSpec.describe ApplicationController,  type: :controller do
  before(:each) do
    @api_control = ApplicationController.new.common_settings
  end

  it "code" do
    expect(@api_control['currency'].keys).to match(["USD", "RUB", "EUR", "CNY", "TRY", "UAH"]) 
  end

  it '' do
    expect(@api_control['stage_select']).to match({"s1"=>"Stage1", "s2"=>"Stage2", "s3"=>"Stage3", "s4"=>"Stage4", "prod"=>"Production", "s5" => 'Stage5', "s6" => "Stage6", "s7" => "Stage7",})
  end
  it '' do
    expect(@api_control['drivers'].keys).to match(["chrome", "firefox"])
  end
  it '' do
    expect(@api_control['locale'].keys).to match(["RU", "EN", "ID", "MS", "ES", "TH", "VN", "CN", "PT", "MD", "RO", "KR"])
  end
  it '' do
    expect(@api_control['frame_work']).to match({"cucumber"=>"cucumber"})
  end
  it '' do
    expect(@api_control['tariff']).to match({"FTD 1"=>"0", "FTD 2"=>"1", "CPA"=>"2", "CPA %"=>"3", "CPL SOI" => "4", "CPL DOI"=>"5"})
  end
end
