# require 'rails_helper'
#
# RSpec.describe "Api tournaments success" do
#   before(:context) do
#     @tournaments = Tournaments.new.api("ru", "web")
#
#       ids = []
#       ids << @tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" }
#       @id_max = ids[0].compact.max
#       print "#{$id_max}".yellow
#
#     @email = Cookies.where(stage: "#{ENV['stage']}").last.email
#     @password = "12345q"
#     # @partcitipate = Tournaments.new.participate("ru", "web", password, email, @id_max)
#     # @partcitipants = Tournaments.new.participants("ru", "web", @id_max)
#     # @show = Tournaments.new.show("ru", "web", @id_max)
#
#   end
#
#   context "params list" do
#
#     it 'dd' do
#       puts @partcitipate = Tournaments.new.participate("ru", "web", @password, @email, @id_max)[1]
#       puts
#
#       puts @partcitipants = Tournaments.new.participants("ru", "web", @id_max)[1]
#       puts
#
#       puts @show = Tournaments.new.show("ru", "web", @id_max)
#       puts
#
#     end
#   end
# end
