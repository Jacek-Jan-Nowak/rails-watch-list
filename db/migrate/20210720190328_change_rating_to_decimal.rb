class ChangeRatingToDecimal < ActiveRecord::Migration[6.0]
  def up
    change_column :movies, :rating, :decimal
  end

  def down 
    change_column :movies, :rating, :float
  end
end
