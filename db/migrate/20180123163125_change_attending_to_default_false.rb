class ChangeAttendingToDefaultFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :guests, :attending, :boolean, :default => false
  end
end
