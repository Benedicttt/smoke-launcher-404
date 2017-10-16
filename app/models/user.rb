class User < ApplicationRecord
  has_one :reports_user, foreign_key: :user_id
end
