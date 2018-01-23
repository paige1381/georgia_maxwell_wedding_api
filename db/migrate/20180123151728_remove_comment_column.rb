class RemoveCommentColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :rsvps, :comment
  end
end
