require 'faker'

# Create Users
15.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

# user = User.new(
#    name:     'Member User',
#    email:    'valeriemettler@yahoo.com',
#    password: 'helloworld'
#   )
#   user.skip_confirmation!
#   user.save

# users = User.all

# Create Languages
10.times do
  Language.create!(
  name:   Faker::Lorem.characters(10),
   )
end
languages = Language.all

# Create Questions
5.times do
  question = Question.create(
  user:   users.sample,
  language: languages.sample,
  body:   Faker::Lorem.words(4)
  )
  # set the created_at to a time within the past year
  # question.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  # question.update_rank
end
questions = Question.all
 
# Create Answers
5.times do
  answer = Answer.create!(
  user:   users.sample,
  question: questions.sample,
  body:   Faker::Lorem.sentence
  )
  #set the created_at to a time within the past year
  answer.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  answer.update_rank
end
answers = Answer.all

# Create Comments
# 10.times do
#   Comment.create(
#     # user: users.sample, 
#     # question: questions.sample,
#     body: Faker::Lorem.paragraph
#   )
#    # set the created_at to a time within the past year
#    # comment.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
# end

#Create an admin user
 admin = User.new(
  name:  'Admin User',
  email: 'valeriemettler@gmail.com',
  password: 'helloworld',
 role:     'admin'
 )
 admin.skip_confirmation!
 admin.save
 
 # Create a moderator
 # moderator = User.new(
 #   name:     'Moderator User',
 #   email:    'valerie_mettler@yahoo.ca', 
 #   password: 'helloworld',
 #   role:     'moderator'
 # )
 # moderator.skip_confirmation!
 # moderator.save
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'valeriemettler@yahoo.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Language.count} languages created"
puts "#{Question.count} questions created"
puts "#{Answer.count} answers created"
# puts "#{Comment.count} comments created"