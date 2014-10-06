class Question < ActiveRecord::Base
  # require 'obscenity/active_model'
  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :language

  default_scope { order('created_at DESC') }

  validates :body, length: { minimum: 10, maximum: 160 }, presence: true
  # validates :body,  obscenity: { sanitize: true, replacement: "[censored]" }
  validates :user, presence: true

end
