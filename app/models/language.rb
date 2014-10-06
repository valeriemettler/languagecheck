class Language < ActiveRecord::Base
  has_many :questions

  # default_scope { order('rank DESC')  ##what is the equivalent for ranking in alphabetical order?

  # validates :name, length: { minimum: 3, maximum: 15 }, presence: true

end
