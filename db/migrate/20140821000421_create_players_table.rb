class CreatePlayersTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :height
      t.string :weight
      t.string :birthday
      t.string :country
      t.string :birth_place
      t.string :turned_pro
      t.datetime :sports_data_updated_on

      t.timestamps
    end
  end
end