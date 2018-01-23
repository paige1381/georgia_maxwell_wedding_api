class AddForeignKeyToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :rsvp_id, :integer
  end
end
