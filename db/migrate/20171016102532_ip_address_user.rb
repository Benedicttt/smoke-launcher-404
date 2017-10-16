class IpAddressUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ip_address, :string
    add_column :partners, :ip_address, :string
  end
end
