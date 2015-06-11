class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id
      t.integer :respondent_user_id

      t.timestamps
    end
    add_index :responses, :answer_choice_id
    add_index :responses, :respondent_user_id
  end
end
