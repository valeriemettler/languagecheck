class Language < ActiveRecord::Base
  require 'obscenity/active_model'
  has_many :questions

  default_scope { order('languages.name ASC') }

  validates :name, obscenity: true
  validates :name, length: { minimum: 3, maximum: 15 }, presence: true
end
