class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps
    end

    create_table :picks do |t|
      t.integer :user_id
      t.integer :player_id

      t.timestamps
    end
  end
end
