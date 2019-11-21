# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#仮ユーザー
20.times do
  gimei = Gimei.new

  Customer.create!(
    last_name: gimei.last.kanji,
    first_name: gimei.first.kanji,
    last_name_read: gimei.last.hiragana,
    first_name_read: gimei.first.hiragana,
    email: Faker::Internet.email,
    postal_code: Faker::Address.postcode,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: gimei.address.kanji + '3-20-14',
    password: 123456
  )
end

#登録住所
4.times do
  gimei = Gimei.new
  RegistrationAddress.create!(
    name: gimei.last.kanji + gimei.first.kanji,
    phone_number: Faker::PhoneNumber.cell_phone,
    postal_code: Faker::Address.postcode,
    address: gimei.address.kanji + '3-20-14',
    customer_id: 21
  )
end

#購入履歴
5.times do
  gimei = Gimei.new

  Order.create!(
    customer_id: 1,
    status: Faker::Number.between(from: 0, to: 2),
    payment_method: Faker::Number.between(from: 0, to: 2),
    subtotal_amount: Faker::Number.between(from: 1000, to: 5000),
    total_amount: Faker::Number.between(from: 1000, to: 5000),
    contractee_name: gimei.name.kanji,
    contractee_phone_number: Faker::PhoneNumber.cell_phone,
    postal_code: Faker::Address.postcode,
    destination_name: gimei.name.kanji,
    destination_address: gimei.address.kanji + '3-20-14',
    destination_phone_number: Faker::PhoneNumber.cell_phone
  )
end

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
