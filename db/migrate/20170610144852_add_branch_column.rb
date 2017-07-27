class AddBranchColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :branch, :string
    add_column :users, :branch, :string
  end
end
