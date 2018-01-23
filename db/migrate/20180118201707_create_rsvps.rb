class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.string :email
      t.string :plus_one
      t.string :plus_one_entree
      t.string :comment

      t.timestamps
    end
  end
end
