class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :locale
      t.string :currency
    end
      add_column :users, :stage_number, :string
      add_column :users, :geo_locale, :string
      add_column :users, :platform, :string
      add_column :users, :email_confirmed, :boolean
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :password, :string
      add_column :users, :driver, :string
      add_column :users, :phone_verifed, :boolean
      add_column :users, :wire_capital, :string
      add_column :users, :ecommpay, :string
      add_column :users, :card_pay, :string
      add_column :users, :document_verifed, :boolean
      add_column :users, :status, :string
      add_column :users, :refcode, :string
      add_column :users, :partner_id, :integer
      add_timestamps(:users, null: true)

    create_table :partners do |t|
      t.string :skype
      t.string :nickname
      t.string :card
      t.string :driver
      t.string :email
      t.string :refcode
      t.string :locale
      t.string :stage_number
      t.string :phone
      t.boolean :tariff_first
      t.boolean :tariff_last
      t.boolean :cpa_first
      t.boolean :cpa_last
      t.string :platform
    end
    add_column :partners, :partner_id, :integer
    add_timestamps(:partners, null: true)
  end
end
