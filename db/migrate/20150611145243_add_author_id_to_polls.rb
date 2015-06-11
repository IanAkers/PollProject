class AddAuthorIdToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :author_user_id, :integer, null: false
    add_index :polls, :author_user_id
  end
end
