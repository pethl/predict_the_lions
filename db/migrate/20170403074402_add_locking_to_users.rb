class AddLockingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lock_players, :boolean, null: false, default: false
    add_column :users, :lock_games, :boolean, null: false, default: false
  end
end
