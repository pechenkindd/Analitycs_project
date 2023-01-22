class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.integer :new_number, null: false
      t.text :topic, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
