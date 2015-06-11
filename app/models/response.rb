class Response < ActiveRecord::Base

  validate :answer_choice_id, :presence => true
  validate :respondent_user_id, :presence => true
  validate :respondent_has_not_already_answered_question
  validate :respondent_cannot_respond_to_own_poll


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

  has_one(
    :question,
    :through => :answer_choice,
    :source => :question
  )

  has_one(
    :poll,
    :through => :question,
    :source => :poll
  )

  def sibling_responses
    if self.id.nil?
      self.question.responses
    else
      self.question.responses.where("responses.id <> #{self.id}")
    end
  end

  private

  def respondent_has_not_already_answered_question
    same_question_responses = self.sibling_responses
    same_question_responses.each do |response|
      if response.respondent_user_id == respondent_user_id
        errors[:base] << "This user has already answered the question."
      end
    end
  end

  def respondent_cannot_respond_to_own_poll
      if question.poll.author.id == respondent_user_id
        errors[:base] << "This user created the poll!"
      end
  end

end
