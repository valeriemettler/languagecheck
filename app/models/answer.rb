class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, dependent: :destroy
  #has_many :votes, dependent: :destroy

 #after_create :send_answer_emails

# default_scope { order('rank DESC') } #rank by votes if votes are present, otherwise rank by DESC

 validates :body, length: { minimum: 1, maximum: 160 }, presence: true


end
