require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:      Faker::Name.name,
     email:     Faker::Internet.email,
     password:  Faker::Lorem.characters(10)
     )
   user.skip_confirmation!
   user.save!
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