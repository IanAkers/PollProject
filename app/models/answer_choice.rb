class AnswerChoice < ActiveRecord::Base

  validates :title, :presence => true
  validates :author_user_id, :presence => true

  belongs_to(
    :question,
    :class_name => "Question",
    :foreign_key => :question_id,
    :primary_key => :id
  )

  has_many(
    :responses,
    :class_name => "Response",
    :foreign_key => :answer_choice_id,
    :primary_key => :id
  )
end
