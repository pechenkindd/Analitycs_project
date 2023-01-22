class RemoveColumnFromThemes < ActiveRecord::Migration[7.0]
  def change
    remove_column :themes, :theme_number
  end
end
