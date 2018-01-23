class RemovePlusOneColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :rsvps, :plus_one
    remove_column :rsvps, :plus_one_entree
  end
end
