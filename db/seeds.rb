require 'faker'

# Create Users
5.times do
  user = User.new(
    name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password:  "helloworld"  
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Lists
users.each do |element|
  list = List.create!(
    user:        element,
    name:        Faker::Lorem.words(3).join(" "),
    created_at:  Time.now
    )
end
lists = List.all

# Create Tasks
lists.each do |element|
  5.times do
    task = Task.create!(
      description: Faker::Lorem.sentence,
      list: element
      )
  end
end

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
  )
member.skip_confirmation!
member.save!

# Create my own account
matt = User.new(
  name:     'Matthew T Farley',
  email:    'matthewthomasfarley@gmail.com',
  password: 'helloworld'
  )
matt.skip_confirmation!
matt.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Task.count} tasks created"