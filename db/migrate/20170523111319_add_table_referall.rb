class AddTableReferall < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :referall, :string
    create_table :cookies do |t|
      t.string :cookies_traider
    end

    add_column :partners, :bonuse_code, :string
    change_table :partners do |t|
      t.rename :partner_id, :link_partner
    end

  end
end
