class Question < ActiveRecord::Base

  validate :question_text, :presence => true
  validate :poll_id, :presence => true

  belongs_to(
    :poll,
    :class_name => "Poll",
    :foreign_key => :poll_id,
    :primary_key => :id
  )

  has_many(
    :answer_choices,
    :class_name => "AnswerChoice",
    :foreign_key => :question_id,
    :primary_key => :id
  )

  has_many(
    :responses,
    :through => :answer_choices,
    :source => :responses
  )

  has_many(
    :respondents,
    :through => :responses,
    :source => :respondent
  )

  def results_n_plus_one
    answer_choices = self.answer_choices
    results = Hash.new(0)
    answer_choices.each do |answer|
      results[answer.answer_text] = answer.responses.count
    end

    results
  end

  def results
    answer_choices = self.answer_choices.includes(:responses)
    results = Hash.new(0)
    answer_choices.each do |answer|
      results[answer.answer_text] = answer.responses.length
    end

    results
  end

  def results_sql
    answers = self
      .answer_choices
      .select("answer_choices.*, COUNT(responses.id) AS responses_per_answer")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .where("answer_choices.question_id = #{self.id}")
      .group("answer_choices.id")
      .order("answer_choices.id")
    results = Hash.new(0)

    answers.map do |answer|
      results[answer.answer_text] = answer.responses_per_answer
    end

    results



    # SELECT
    #   answer_choices.*, COUNT(responses.id) AS responses_per_answer
    # FROM
    #   answer_choices
    # LEFT OUTER JOIN
    #   responses
    # ON
    #   answer_choices.id = responses.answer_choice_id
    # WHERE
    #   answer_choices.question_id = 1
    # GROUP BY
    #   answer_choices.id
    # ORDER BY
    #   answer_choices.id
    # #
    # SQL
  end
end
