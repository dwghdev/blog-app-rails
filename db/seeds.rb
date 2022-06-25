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
  password_confirmation: "password",
  name: "Test", 
  role: User.roles[:user]
)

elapsed = Benchmark.measure do
  posts = []
  1000.times do |x|
    puts "Creating post #{x}"
    post = Post.new(
      title: "Title #{x}",
      user_id: User.first.id,
      body: "Body #{x} words goes here"
    )

    10.times do |y|
      puts "Create comment #{y} for post #{x}"
      post.comments.new(
        user_id: User.second.id,
        body: "Body #{x} words goes here"
      )
    end
    posts.push(post)
  end
  Post.import(posts)
end

puts "Elapsed time is #{elapsed.real} seconds"
