class Answer < ActiveRecord::Base
  belongs_to :question, dependent: :destroy
  has_many :comments, dependent: :destroy
  #has_many :votes, dependent: :destroy

 #after_create :send_answer_emails

end
