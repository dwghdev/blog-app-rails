# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
  email: "admin@email.com",
  password: "password",
  password_confirmation: "password",
  name: "Admin",
  role: User.roles[:admin]
)

User.create(
  email: "test@email.com",
  password: "password",
  password_confirmation: "password"<
  name: "Test", 
  role: User.roles[:user]
)

10.times do |x|
  Post.create(
    title: "Body #{x} words goes here",
    user_id: User.first.id
  )

  5.times do |x|
    Comment.create(
      title: "Body #{x} words goes here",
      user_id: User.second.id,
      post_id: post.id
    )
  end
end
