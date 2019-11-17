# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
	Artist.create!(
		name: Faker::Music.band)
end

20.times do
	Category.create!(
		name: Faker::Music.genre)
end

20.times do
	RecordLabel.create!(
		name: Faker::Company.name)
end

20.times do
	Product.create!(
		artist_id: Faker::Number.between(from: 1, to: 20),
		record_label_id: Faker::Number.between(from: 1, to: 20),
		category_id: Faker::Number.between(from: 1, to: 20),
		format: Faker::Number.between(from: 1, to: 4),
		title: Faker::Music.album,
		sales_date: Faker::Date.in_date_period(year: 2018, month: 2),
		price: Faker::Number.between(from: 1000, to: 2000),
		)
end

40.times do
	Disc.create!(
		number: Faker::Number.between(from: 1, to: 4),
		product_id: Faker::Number.between(from: 1, to: 20),
		)
end

100.times do
	Song.create!(
		disc_id:  Faker::Number.between(from: 1, to: 40),
		title: Faker::Book.title,
		number: Faker::Number.between(from: 1, to: 4),
		recording_time: Faker::Number.between(from: 300, to: 500)
		)
end
