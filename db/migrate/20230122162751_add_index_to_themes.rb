class AddIndexToThemes < ActiveRecord::Migration[7.0]
  def change
    add_index :themes, :theme_number, unique:true
  end
end
