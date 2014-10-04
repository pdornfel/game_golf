class AddEarningsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :earnings, :integer
    add_column :users, :earnings_updated_at, :datetime
  end
end
