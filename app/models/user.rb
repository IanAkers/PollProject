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

end
