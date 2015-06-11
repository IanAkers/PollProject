class MakeAnswerChoicesFieldsNotNull < ActiveRecord::Migration
  def change
    change_column :polls, :title, :string, null: false
    remove_column :polls, :author, :string
  end
end
