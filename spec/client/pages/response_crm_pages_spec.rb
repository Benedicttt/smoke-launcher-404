require 'rails_helper'

RSpec.describe "get request authorize CRM" do
  context "Crm part 1" do
    $link_crm_1.each_line do |link|
      it "get url #{link}" do
      url = "https://#{ENV['stage'].sub('.', '')}-crm.binomo.com/#{link}"
        safeurl = URI.encode(url.strip)

        response = RestClient.get(
        safeurl,
          cookies: {
             :_crm_binomo_com_session => "Z1pjL2FOU0pTVUg1ZUc2Z3lwZnM1SlV1ZjQ3Q1pQWTFJbnk5MnZMV1BwdWRZUGF1VCtiSzZWTEcvV2lzamxOZGlWT09HTlV2aFBzYWtGR0dTUEtOSUNNWXUvM2NLSDJPMEl1YW9QRmNOdkRRcWc4Ujl6dlQvY25pVlAyZGQ5VWNuRU9KUCtPd0tvTVAyclFzS0M4eE5iRncvRG5wM29RdTg4WUJCMW1WalM4RFhQS2duMk5EcmtCMjJXM01uY3FMLS1taGVkbDJ5Zk1nSEZkSFgvd25YRk5BPT0%3D--4348dac73f4621d58004ca274e5ba0a3606fc96a",
             :crm_user_id => "MzE%3D--e5fc5953804cefddbc38c963fea880e84941d866"
           } ) if ("#{ENV['stage']}") == "s2."

        response = RestClient.get(
        safeurl,
          cookies: {
             :_crm_binomo_com_session => "QmxwamJpalJLSFVsekIvaE5kVElPQUxSbVlkWXRJZDY4eUs1dklIVWUxalBjcjJYRVl4Q2k3Z0VNbUw3N0JiR3dUV2ZWMzd6VStRUEJENzhsYmovR1dycmNtUmQ4Y1ZrbjBxeGtVLzZFMVMrQVlWVlkvbUM5TEY1UHp2MTNrY294Ym9MUnVLc3hIUkZhcHZ1T3dZR211NUoxQ09razlxcURURmF6eGppNzdET201WkNaSjJBaVAwQk5CK2htMVI2LS1hUTBnL0psOVRBZDc0SkhHYlcycS9nPT0%3D--6a1316dbd61c427bd71c1ed1fddf9f78e25f084f",
             :crm_user_id => "Mg%3D%3D--3b3e31a723ebc9fe2054ada2bf5e860f146b2631"
            } ) if ("#{ENV['stage']}") == "s1."
         sleep 0.1
         expect(response.code).to eq(200)
      end
    end
  end

  context "Crm part 2" do
    $link_crm_2.each_line do |link|
      it "get url #{link}" do
        url = "https://#{ENV['stage'].sub('.', '')}-crm.binomo.com/#{link}"
        safeurl = URI.encode(url.strip)

        response = RestClient.get(
        safeurl,
        cookies: {
           :_crm_binomo_com_session => "Z1pjL2FOU0pTVUg1ZUc2Z3lwZnM1SlV1ZjQ3Q1pQWTFJbnk5MnZMV1BwdWRZUGF1VCtiSzZWTEcvV2lzamxOZGlWT09HTlV2aFBzYWtGR0dTUEtOSUNNWXUvM2NLSDJPMEl1YW9QRmNOdkRRcWc4Ujl6dlQvY25pVlAyZGQ5VWNuRU9KUCtPd0tvTVAyclFzS0M4eE5iRncvRG5wM29RdTg4WUJCMW1WalM4RFhQS2duMk5EcmtCMjJXM01uY3FMLS1taGVkbDJ5Zk1nSEZkSFgvd25YRk5BPT0%3D--4348dac73f4621d58004ca274e5ba0a3606fc96a",
           :crm_user_id => "MzE%3D--e5fc5953804cefddbc38c963fea880e84941d866"
         } ) if ("#{ENV['stage']}") == "s2."

      response = RestClient.get(
      safeurl,
        cookies: {
           :_crm_binomo_com_session => "QmxwamJpalJLSFVsekIvaE5kVElPQUxSbVlkWXRJZDY4eUs1dklIVWUxalBjcjJYRVl4Q2k3Z0VNbUw3N0JiR3dUV2ZWMzd6VStRUEJENzhsYmovR1dycmNtUmQ4Y1ZrbjBxeGtVLzZFMVMrQVlWVlkvbUM5TEY1UHp2MTNrY294Ym9MUnVLc3hIUkZhcHZ1T3dZR211NUoxQ09razlxcURURmF6eGppNzdET201WkNaSjJBaVAwQk5CK2htMVI2LS1hUTBnL0psOVRBZDc0SkhHYlcycS9nPT0%3D--6a1316dbd61c427bd71c1ed1fddf9f78e25f084f",
           :crm_user_id => "Mg%3D%3D--3b3e31a723ebc9fe2054ada2bf5e860f146b2631"
          } ) if ("#{ENV['stage']}") == "s1."
          sleep 0.1
         expect(response.code).to eq(200)
       end
     end
  end
end
