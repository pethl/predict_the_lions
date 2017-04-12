class CreateUserplayers < ActiveRecord::Migration
  def change
    create_table :userplayers do |t|
      t.integer :user_id
      t.integer :player_id
      t.boolean :selected

      t.timestamps null: false
    end
  end
end
