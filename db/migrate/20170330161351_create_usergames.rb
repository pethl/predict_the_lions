class CreateUsergames < ActiveRecord::Migration
  def change
    create_table :usergames do |t|
      t.integer :user_id
      t.integer :game_id
      t.boolean :home_win
      t.boolean :away_win
      t.boolean :margin_a
      t.boolean :margin_b
      t.boolean :margin_c
      t.integer :points_for_game

      t.timestamps null: false
    end
  end
end
