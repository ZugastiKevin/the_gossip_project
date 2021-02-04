# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all



10.times do
  city = City.create(
    name: Faker::Address.unique.city ,
    zip_code: Faker::Number.number(digits: 5)
  )
end


10.times do
  User.create(
    city_id: City.all.sample.id ,
    first_name: Faker::Name.unique.first_name ,
    last_name: Faker::Name.unique.last_name  ,
    description: Faker::Lorem.unique.paragraph(sentence_count: 2, supplemental: true) ,
    email: Faker::Internet.unique.email ,
    age: Faker::Number.between(from: 18, to: 80)
  )
end



20.times do
  Gossip.create(
    user_id: User.all.sample.id ,
    title: Faker::Book.unique.title ,
    content: Faker::Lorem.unique.paragraph(sentence_count: 4, supplemental: true)
  )
end



10.times do 
  Tag.create(
    gossip_id: Gossip.all.sample.id ,
    title: Faker::ChuckNorris.fact
  )
end



5.times do 
  PrivateMessage.create(
    content: Faker::Lorem.unique.paragraph(sentence_count: 1, supplemental: true)
  )
end



puts "tas tous cree OK"