class ChangeFriendIdToForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_column :invitations, :friend_id
  end
end
