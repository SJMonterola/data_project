# Author.destroy_all
# CatFact.destroy_all
# DogFact.destroy_all

# # Creating 7 different records for each table

# 7.times do
#   Author.create(
#     name: Faker::Name.name,
#     biography: "A #{Faker::Job.employment_type} #{Faker::Job.title} who loves to " +
#     "#{Faker::Hobby} in their spare time."
#   )

#   CatFact.create(
#     name: Author.name,
#     date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
#     :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
#     cat_fact: `GET /facts/random?animal_type=cat&amount=1`
#   )

#   DogFact.create(
#     name: Author.name,
#     date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
#     :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
#     dog_fact:
#   )
# end
