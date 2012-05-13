namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_user_lists
    make_relationships
  end
end

def make_user_lists
    users = User.all(limit: 6)
    50.times do
      list_name = Faker::Lorem.sentence(5)
      users.each {|user| user.userlists.create!(list_name: list_name)}
    end
end

def make_users
    User.create!(name: "Example User",
                 email: "example@user.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@user.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
end


def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end