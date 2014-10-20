class CreateGroupsAndCreateMemberships < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    create_table :groups_users do |t|
      t.belongs_to :user
      t.belongs_to :group
    end
  end
end
