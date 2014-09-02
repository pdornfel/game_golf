class AddNullFalseToPicks < ActiveRecord::Migration
  def up
    change_table :picks do |t|
      t.change :user_id, :integer, null: false
      t.change :player_id, :integer, null: false
    end
  end

  def down
    change_table :picks do |t|
      t.change :user_id, :integer, null: true
      t.change :player_id, :integer, null: true
    end
  end
end
