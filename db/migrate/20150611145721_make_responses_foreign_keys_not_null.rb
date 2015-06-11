class MakeResponsesForeignKeysNotNull < ActiveRecord::Migration
  def change
    change_column :responses, :respondent_user_id, :integer, null: false
    change_column :responses, :answer_choice_id, :integer, null: false
  end
end
