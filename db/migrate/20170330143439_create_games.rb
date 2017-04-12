class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :game_date
      t.integer :ref
      t.string :home_team
      t.string :away_team
      t.string :location
      t.integer :home_score
      t.integer :away_score
      t.integer :gap

      t.timestamps null: false
    end
  end
end
