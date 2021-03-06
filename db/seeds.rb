# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 10 blog posts for test

3.times do |topic|
  Topic.create!( title: "Topic   #{topic}")
end
 puts "3 Topics created"

10.times do |blog|
  Blog.create!(
       title: "My Blog Post #{blog}",
       body: "this is test text for the body of the blog entry for blog number: #{blog + 1}.  There will be many more to come........",
       topic_id: Topic.last.id,
       status: 0)
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
       title: "Rails #{skill}",
       percent_utilized: 15
  )
end

puts "5 skills created."

8.times do |portfolio_item|
  Portfolio.create!(
  title: "Portfolio title: #{portfolio_item}",
  subtitle: "Ruby on Rails",
  body:  "more latin discussion.........",
  main_image: "http://via.placeholder.com/600x200/000FF/000000",
  thumb_image: "http://via.placeholder.com/350x200/000000/FFFFFF"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
  title: "Portfolio title: #{portfolio_item}", 
  subtitle: "Angular",
  body:  "more latin discussion.........",
  main_image: "http://via.placeholder.com/600x200/000FF/000000",
  thumb_image: "http://via.placeholder.com/350x200/000000/FFFFFF"
  )
end
puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
  name: "Technology #{technology}"
  )
end

puts "3 technologies created"

