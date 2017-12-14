# require 'rails_helper'
#
# RSpec.describe "Api tournaments success" do
#   before(:context) do
#     @currency = []
#     Tournaments.new.api("ru", "web")['data'][0]['participation_fees'].map do |key, value|
#       @currency << key
#     end
#     @list = Tournaments.new.api("ru", "web")['data'][0]['participation_fees']
#   end
#
#   context "params list tournament" do
#     it "fff" do
#
#       @currency.each_with_index do |key, index|
#         key == @list.keys[index]
#       end
#
#
#     end
#   end
#
# end
