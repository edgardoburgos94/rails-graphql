10.times do
  user = User.create(email: Faker::Internet.email, name: Faker::Name.name)
  user.books.create(title: Faker::Book.title)
end