class AddReportsSmoke < ActiveRecord::Migration[5.0]
  def change
    create_table :reports_users do |t|
      t.integer :user_id
      t.string :email
      t.string :platform
      t.string :stage
      t.text :report
    end

    create_table :reports_partners do |t|
      t.integer :user_id
      t.string :email
      t.string :platform
      t.string :stage
      t.text :report
    end
    add_timestamps(:reports_partners, null: true)
    add_timestamps(:reports_users, null: true)
  end
end
