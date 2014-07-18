test = [1,2,3,4,5,6,7,8,9,10]

10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

Restaurant.create(name: "McDonald's", creator_id: 1, category: "American", street_address: "123 Fake Street", city: "Metropolis", state: "ME")
Restaurant.create(name: "Bernie's Bistro", creator_id: 5, category: "Vegetarian", street_address: "125 Fake Street", city: "Gotham", state: "NY")


10.times do
  Review.create(content: Faker::Lorem.paragraph, title: Faker::Hacker.say_something_smart, reviewer_id: test.sample, restaurant_id: [1,2].sample)
end

15.times do
  Comment.create(content: Faker::Hacker.say_something_smart, commenter_id: test.sample, review_id: test.sample)
end

2.times do
  Comment.create(content: Faker::Hacker.say_something_smart, commenter_id: test.sample, parent_id: [1,2].sample)
end

100.times do
  Vote.create(voter_id: test.sample, voteable_id: test.sample, voteable_type: "Review")
end

10.times do
  Vote.create(voter_id: test.sample, voteable_id: [1,2].sample, voteable_type: "Restaurant")
end

10.times do
  Vote.create(voter_id: test.sample, voteable_id: (1..17).to_a.sample, voteable_type: "Comment")
end


