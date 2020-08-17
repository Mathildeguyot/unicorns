class CreateUnicorns < ActiveRecord::Migration[6.0]
  def change
    create_table :unicorns do |t|
      t.string :name
      t.string :magic_power
      t.text :description
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
