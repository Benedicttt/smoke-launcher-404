class AddColumnCookiesPartner < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :cookies, :jsonb
  end
end
