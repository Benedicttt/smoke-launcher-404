class AddColumnToken < ActiveRecord::Migration[5.0]
  def change
    add_column :cookies, :reset_password_token, :string
  end
end
