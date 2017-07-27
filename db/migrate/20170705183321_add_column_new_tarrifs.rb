class AddColumnNewTarrifs < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :cpl_soi, :boolean
    add_column :partners, :cpl_doi, :boolean
  end
end
