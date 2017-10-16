class Partner < ApplicationRecord
  has_many :users, -> { where refcode: refcode }
  has_one :reports_partner, foreign_key: :user_id
end
