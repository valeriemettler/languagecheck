class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :language

  default_scope { order('created_at DESC') }
end
