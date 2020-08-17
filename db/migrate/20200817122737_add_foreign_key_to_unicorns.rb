class AddForeignKeyToUnicorns < ActiveRecord::Migration[6.0]
  def change
    add_reference :unicorns, :user, foreign_key: true
  end
end
