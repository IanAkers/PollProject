# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
10.times do |i|
  users << User.create!(user_name: "User #{i+1}")
end

polls = []
users.each_with_index do |user,idx|
  polls << Poll.create!(title: "Poll #{idx}", author_user_id: user.id)
end

questions = []
polls.each do |poll|
  questions << Question.create!(question_text: "Question 1", poll_id: poll.id)
end

answer_choices = []
questions.each do |question|
  3.times do |i|
    answer_choices << AnswerChoice.create!(answer_text: "Answer Choice #{i}", question_id: question.id)
  end
end

responses = []
index = 0

3.times do |i|
  answer_choices.each_with_index do |answer_choice, index|

    if index % 3 == 0
      responses << Response.create!(answer_choice_id: answer_choice.id, respondent_user_id: users[i].id)
    end
  end
end

3.times do |i|
  answer_choices.each_with_index do |answer_choice, index|

    if (index + 1) % 3 == 0
      responses << Response.create!(answer_choice_id: answer_choice.id, respondent_user_id: users[i+3].id)
    end
  end
end
