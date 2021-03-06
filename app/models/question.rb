class Question < ActiveRecord::Base
  require 'obscenity/active_model'
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy=>true
  belongs_to :user
  belongs_to :language

  default_scope { order('created_at DESC') }
  
  validates :body, obscenity: true
  validates :body, length: { minimum: 10, maximum: 160 }, presence: true
  #validates :user, presence: true

  def unanswered
    answers.blank?
  end

  def answered
    answers.any?
  end
end
