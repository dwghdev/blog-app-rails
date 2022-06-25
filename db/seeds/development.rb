puts "Seeding development database"

admin = User.first_or_create!(
  email: "admin@email.com",
  password: "password",
  password_confirmation: "password",
  first_name: "AdminFirst",
  last_name: "AdminLast",
  role: User.roles[:admin]
)

user = User.first_or_create!(
  email: "user1@email",
  password: "password",
  password_confirmation: "password",
  first_name: "UserFirst",
  last_name: "UserLast",
  role: User.roles[:user]
)

Address.first_or_create!(
  street: "123 Main St",
  city: "AnyTown",
  zip: "12345",
  country: "Philippines",
  user: admin
)

Address.first_or_create!(
  street: "123 Main St",
  city: "AnyTown",
  zip: "12345",
  country: "Philippines",
  user: user
)

elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(
      title: "Title #{x}",
      body: "Body #{x} words goes here",
      user: admin
    )

    5.times do |y|
      puts "Creating comment #{y} for post #{x}"
      post.comments.build(
        body: "Comment #{y}",
        user: user
      )
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"
