# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i| 
  Article.create(title: "Post #{i}", body: "This is the content of the post #{i}.")
end

Article.create(title: "I am Tom!", body: "And some content here.")
Article.create(title: "Be happy", body: "It's really good lifeway.")
article1 = Article.create(title: "Hello world!", body: "This is classy hello word post.")

article1.comments.create(author: "Jim", body: "Nice post!")
article1.comments.create(author: "Tom", body: "Keep going my master")