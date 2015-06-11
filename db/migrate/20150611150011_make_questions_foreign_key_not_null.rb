class MakeQuestionsForeignKeyNotNull < ActiveRecord::Migration
  def change
    change_column :questions, :question_text, :string, null: false
    change_column :questions, :poll_id, :integer, null: false
  end
end
