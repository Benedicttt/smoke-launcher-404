class AddColumnCookiesEmail < ActiveRecord::Migration[5.0]
  def change
    add_column :cookies, :email, :string
  end
end
