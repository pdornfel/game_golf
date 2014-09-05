class AddTournamentIdToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :tournament_id, :integer, null: false
  end
end
