class RemoveSpareFieldsFromUsergames < ActiveRecord::Migration
  def up
    remove_column :usergames, :away_win
    remove_column :usergames, :margin_a
    remove_column :usergames, :margin_b
    remove_column :usergames, :margin_c
  end
end
