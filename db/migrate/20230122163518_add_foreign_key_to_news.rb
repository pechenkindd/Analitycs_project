class AddForeignKeyToNews < ActiveRecord::Migration[7.0]
  def change
    add_reference :news, :theme
  end
end
