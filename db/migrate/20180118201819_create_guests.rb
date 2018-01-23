class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :entree
      t.boolean :attending

      t.timestamps
    end
  end
end
