require 'faker'

# Create Users
5.times do
  user = User.new(
    username:   Faker::Internet.user_name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10) 
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Tasks
15.times do
  Task.create!(
    description:  Faker::Lorem.paragraph,
    user: users.sample
  )
end
tasks = Task.all

member = User.new(
  username:     'member',
  email:    'member@example.com', 
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"