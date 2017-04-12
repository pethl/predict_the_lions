class AddSelectedToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :selected, :boolean, null: false, default: false
  end
end
