class RemoveColumnFromNews < ActiveRecord::Migration[7.0]
  def change
    remove_column :news, :new_number
  end
end
