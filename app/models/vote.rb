class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer, dependent: :destroy

  default_scope { order('created_at DESC') }
  
  # validates :user, presence: true
  # validates :answer, presence: true
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_answer

  def up_vote?
    value == 1
  end
 
  def down_vote?
    value == -1
  end

  private

  def update_answer
    answer.update_rank
  end
  
end
