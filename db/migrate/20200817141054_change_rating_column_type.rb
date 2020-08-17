class ChangeRatingColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :rating, :float
  end
end
