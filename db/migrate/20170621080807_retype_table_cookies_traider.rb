class RetypeTableCookiesTraider < ActiveRecord::Migration[5.0]
  def change
    rename_column :cookies, :cookies_traider, :cookies_traider_old
    add_column :cookies, :cookies_traider, :jsonb
    remove_column :cookies, :cookies_traider_old, :string
  end
end
