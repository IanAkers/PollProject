class Response < ActiveRecord::Base

  validates :answer_choice_id, :presence => true
  validates :respondent_user_id, :presence => true

  belongs_to(
    :answer_choice,
    :class_name => "AnswerChoice",
    :foreign_key => :answer_choice_id,
    :primary_key => :id
  )

  belongs_to(
    :respondent,
    :class_name => "User",
    :foreign_key => :respondent_user_id,
    :primary_key => :id
  )

end
