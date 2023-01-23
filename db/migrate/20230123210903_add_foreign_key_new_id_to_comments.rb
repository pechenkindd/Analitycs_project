class AddForeignKeyNewIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :new
  end
end
