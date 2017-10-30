require 'rails/all'
require 'rest-client'
require 'json'

sleep 2
api_deals_create = "https://s1.binomo.com/api/deals/list"
  deals_real_list = RestClient::Request.execute(
  method: :get,
  url: api_deals_create,
  headers: {
    cookies: {
      "geo"=>"RU",
      "authtoken"=>"ImIyMzA3MmM4NDIxMjA0YjVmOTNlM2QyZDc3ZjJkMjVkIg%3D%3D--f49beb75a28462f7fffe3accecf451f47a4142c7",
      "device_id"=>"ImE5OTdjODBjMWI2MzgzZGZiODRkNjFhNzliNWQ2ZWFmIg%3D%3D--5d8c503034d81bffb4ec12189800d3478b46c2a2",
      "_binomo_session"=>
      "cTI0aDZieEVleHZqODBVSk5HYjhnd2ZDMnFvcEJDU0l1bE1maEc2VHJNc2NRS0J1Wnp2RjZvN2VFOHFmNHp4UEVPeDQrNyt1NEpwNUVBMlk0blRuSHc9PS0tcGZBMm1JSTlIN2orQ1FSMGtvQ0Ntdz09--70cc335f3bce834f959b5a4491f92d49c7c41830"},
      params: {
        locale: "ru",
        device: "web",
        deal_type: "tournament",
        tournament_id: "3569",
        geo: "RU"
      }
    }) { |response, request, result, &block|  response }

    puts deals_real_list.body
