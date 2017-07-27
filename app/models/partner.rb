class Partner < ApplicationRecord
  has_many :users, -> { where refcode: refcode }
end
