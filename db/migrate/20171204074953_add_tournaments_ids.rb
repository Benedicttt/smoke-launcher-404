class AddTournamentsIds < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments_ids do |t|
      t.string :stage
      t.integer :tournament_id
    end
  end
end
