class AddWiningmarginToUsergames < ActiveRecord::Migration
  def change
     add_column :usergames, :winning_margin, :string
  end
end
