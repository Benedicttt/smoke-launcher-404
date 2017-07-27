class AddColumnAuthtoken < ActiveRecord::Migration[5.0]
  def change
    add_column :cookies, :authtoken, :string
  end
end
