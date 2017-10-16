class ReportsPartner < ApplicationRecord
  belongs_to :partner, foreign_key: :user_id
end
