# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(6..50).each do |i| 
	New.update(i,
		topic: Faker::Lorem.sentence(word_count: 5, random_words_to_add: 2),
		body: Faker::Lorem.paragraph(sentence_count: 50, random_sentences_to_add: 2),
		theme_id: rand(1..5)
	)
end
