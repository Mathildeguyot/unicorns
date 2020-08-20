class AddCoordinatesToUnicorns < ActiveRecord::Migration[6.0]
  def change
    add_column :unicorns, :latitude, :float
    add_column :unicorns, :longitude, :float
  end
end
