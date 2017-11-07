class AddWelcomeCoupon < ActiveRecord::Migration[5.0]
  def change
    add_column :cookies, :welcome_coupon, :string
  end
end
