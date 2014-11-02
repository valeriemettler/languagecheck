class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :questions
  has_many :answers
  has_many :votes
  # has_many :comments
  mount_uploader :avatar, AvatarUploader

  def role?(base_role)
   role == base_role.to_s
  end

  # def voted(post)
  #   self.votes.where(answer_id: answer.id ).first
  # end

   # def self.top_rated
   #   self.select('users.*') # Select all attributes of the user
   #       .select('COUNT(DISTINCT answers.id) AS answers_count') # Count the answers made by the user
   #       .select('COUNT(DISTINCT questions.id) AS questions_count') # Count the questions made by the user
   #       .select('COUNT(DISTINCT answers.id) + COUNT(DISTINCT questions.id) AS rank') # Add the answer count to the question count and label the sum as "rank"
   #       .joins(:answers) # Ties the answers table to the users table, via the user_id
   #       .joins(:questions) # Ties the questions table to the users table, via the user_id
   #       .group('users.id') # Instructs the database to group the results so that each user will be returned in a distinct row
   #       .order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = answer count + question count)
   # end

end
