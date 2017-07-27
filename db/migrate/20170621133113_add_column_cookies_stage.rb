class AddColumnCookiesStage < ActiveRecord::Migration[5.0]
  def change
    add_column :cookies, :stage, :string
  end
end
