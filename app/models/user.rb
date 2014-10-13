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

end
