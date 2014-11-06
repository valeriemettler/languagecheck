class Answer < ActiveRecord::Base
  require 'obscenity/active_model'
  belongs_to :question
  belongs_to :user
  has_many :votes, dependent: :destroy
  #has_many :comments, dependent: :destroy

  #after_create :send_answer_emails

  default_scope { order('rank DESC') } #rank by votes if votes are present, otherwise rank by DESC
  scope :voted_up, -> { joins(:votes).where("votes.value = ?", 1) } 

  validates :body, obscenity: true
  validates :body, length: { minimum: 1, maximum: 160 }, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value).to_i
  end

  def update_rank
     age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
     new_rank = points + age
     update_attribute(:rank, new_rank)
  end
end
