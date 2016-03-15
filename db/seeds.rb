# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# 500.times do
#   Post.create       title: Faker::Company.catch_phrase,
#                     body: Faker::Hipster.paragraph
# end
#
# 500.times do
#   Comment.create    body: Faker::Hipster.sentence
# end


["Techonology", "Sports", "Medical", "Social", "Education", "Politics", "Economics", "Transportation", "Tourism", "Human Resources"].each {|x| Category.create title: x}
