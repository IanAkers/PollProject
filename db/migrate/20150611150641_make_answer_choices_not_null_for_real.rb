class MakeAnswerChoicesNotNullForReal < ActiveRecord::Migration
  def change
    change_column :answer_choices, :answer_text, :string, null: false
    change_column :answer_choices, :question_id, :integer, null: false
  end
end
