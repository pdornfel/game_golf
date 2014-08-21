class CreatePlayersTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string   :uid
      t.string   :first_name
      t.string   :last_name
      t.integer  :height
      t.integer  :weight
      t.date     :birthday
      t.string   :country
      t.string   :birth_place
      t.string   :turned_pro
      t.date     :sports_data_updated_on

      t.integer :events_played
      t.integer :first_place
      t.integer :second_place
      t.integer :third_place
      t.integer :top_10
      t.integer :top_25
      t.integer :withdrawals
      t.integer :earnings
      t.integer :earnings_rank
      t.integer :drive_avg
      t.integer :drive_acc
      t.integer :gir_pct
      t.integer :world_rank
      t.integer :scoring_avg

      t.timestamps
    end
  end
end
