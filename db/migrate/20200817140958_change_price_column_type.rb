class ChangePriceColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :unicorns, :price, :float
  end
end
