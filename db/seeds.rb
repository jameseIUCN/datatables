# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 1700.times do
#     DataTable.create(
#         title: Faker::Name.prefix,
#         name: Faker::Name.name,
#         username: Faker::Company.buzzword,
#         email: Faker::Internet.free_email,
#         hometown: Faker::WorldCup.city
#     )
# end

10000.times do
    DataTable.create(
        title: Faker::Name.prefix,
        name: Faker::Name.name,
        username: Faker::Company.buzzword,
        email: Faker::Internet.free_email,
        hometown: Faker::WorldCup.city
    )
end