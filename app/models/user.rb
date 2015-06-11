class User < ActiveRecord::Base

  validate :user_name, :presence => true

  has_many(
    :authored_polls,
    :class_name => "Poll",
    :foreign_key => :author_user_id,
    :primary_key => :id
  )

  has_many(
    :responses,
    :class_name => "Response",
    :foreign_key => :respondent_user_id,
    :primary_key => :id
  )

  def completed_polls


  end


end

#
# SELECT
#   polls.id AS poll_id, COUNT(questions.id) AS questions_per_poll
# FROM
#   polls
# JOIN
#   questions ON polls.id = questions.poll_id
# JOIN
#   answer_choices ON questions.id = answer_choices.question_id
# LEFT OUTER JOIN
#   (
#   SELECT
#     *
#   FROM
#     responses
#   WHERE
#     responses.respondent_user_id = 2
#   ) AS responses ON responses.answer_choice_id = answer_choices.id
# GROUP BY
#   polls.id
# --HAVING
#   --COUNT(questions.id)
# ORDER BY
#   polls.id;
#
# SELECT
#   user_polls.id AS poll_id,
#   COUNT(user_polls.id) AS poll_id_answer_count
#   --, user_questions.id AS question_id
#   --,user_answers.id AS answer_id, user_responses.id AS response_id,
#   --user_responses.respondent_user_id AS user_id
# FROM
#   polls AS user_polls
# JOIN
#   questions AS user_questions
#   ON user_polls.id = user_questions.poll_id
# JOIN
#   answer_choices AS user_answers
#   ON user_questions.id = user_answers.question_id
# JOIN
#   responses AS user_responses
#   ON user_answers.id = user_responses.answer_choice_id
# WHERE
#   respondent_user_id = 2
# GROUP BY
#   user_polls.id
# ORDER BY
#   poll_id;
#
#
#
#
#
# SELECT
#   responses.*
# FROM
#   responses
# JOIN
#   answer_choices ON answer_choices.id = responses.answer_choice_id
# JOIN
#   questions ON questions.id = answer_choices.question_id
# JOIN
#   polls ON polls.id = questions.poll_id;
# GROUP BY
#



#
#
# This is the one we're working on
# SELECT
#   user_polls.id AS poll_id, user_questions.id AS question_id,
#   user_answers.id AS answer_id, user_responses.id AS response_id
# FROM
#   polls AS user_polls
# JOIN
#   questions AS user_questions
#   ON user_polls.id = user_questions.poll_id
# JOIN
#   answer_choices AS user_answers
#   ON user_questions.id = user_answers.question_id
# LEFT OUTER JOIN
#   (
#     SELECT
#     *
#     FROM
#     responses
#     WHERE
#     respondent_user_id = 2
#   ) AS user_responses
#   ON user_answers.id = user_responses.answer_choice_id
#







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
