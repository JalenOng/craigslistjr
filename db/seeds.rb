require_relative '../app/models/category'
require_relative '../app/models/post'
# require 'faker'

20.times do
  Category.create(name: Faker::Commerce.department)
end


100.times do
  Post.create(title: Faker::Hacker.say_something_smart, poster: Faker::Name.name, key: Faker::Bitcoin.address, category_id: Category.all.sample.id)
end