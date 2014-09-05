class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.integer :uid
      t.string :event_name
      t.string :venue_name
      t.string :city
      t.string :state
      t.string :country
      t.integer :purse
      t.date :tournament_start
      t.date :tournament_end
      t.integer :course_id

      t.timestamps
    end

    create_table :courses do |t|
      t.integer :uid
      t.string :course_name
      t.string :city
      t.string :description
      t.integer :par 
      t.integer :yardage

      t.timestamps
    end

    create_table :holes do |t|
      t.integer :course_id
      t.string :description
      t.integer :hole_number
      t.integer :hole_yardage
      t.integer :par

      t.timestamps
    end
  end
end