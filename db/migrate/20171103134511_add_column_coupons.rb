class AddColumnCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.integer :user_id
      t.string :stage
      t.string  :welcome
      t.string  :common
      t.integer :bonus
      t.string  :bonus_deposit
      t.integer :free_deals
    end
  end
end
