# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# Pour garder un nombre cohérent de User / Cities etc... avec les nouveaux migrates et seeds
# pendant les phases de test, on destroy toutes les entrées des tables à chaque début de seed

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all

10.times do 
	
	city = City.create!(
		name: Faker::Address.city,
		zip_code: Faker::Base.regexify(/[0-8][0-9][0-9]{3}/)
		)
	puts "City added"

	user = User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		description: Faker::GreekPhilosophers.quote,
		email: Faker::Internet.email,
		age: rand(18..99), # random pour avoir un age au hasard entre 18 et 99 ans
		city: city,
		city_id: city.id,
		password: "dumdum", # valeur par défaut du mdp
		avatar: Faker::Avatar.image		
		)
	puts "User added"

	tag = Tag.create!(
		title: Faker::Lorem.word
		)
	puts "Tag added"

	2.times do
		@gossip = Gossip.create!(
			title: Faker::Lorem.paragraph_by_chars(number: 14),
			content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
			user: user,
			user_id: user.id
			)
		puts "Gossip added"
	end

	@number_comments = rand(1..8)

	@number_comments.times do
		comment = Comment.create!(
				content: Faker::Movie.quote,
				user: user,
				gossip: @gossip,
				user_id: user.id,
				gossip_id: @gossip.id
			)
	end

end
