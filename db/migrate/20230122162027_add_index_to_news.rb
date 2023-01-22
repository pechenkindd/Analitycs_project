class AddIndexToNews < ActiveRecord::Migration[7.0]
  def change
    add_index :news, :new_number, unique: true
  end
end
