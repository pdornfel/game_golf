class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|

      t.integer :tournament_id
      t.integer :player_id
      t.integer :position
      t.integer :money
      t.integer :score
      t.integer :strokes


      t.timestamps
    end
  end
end
