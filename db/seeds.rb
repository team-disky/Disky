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
4.times do |n|
  3.times do
  gimei = Gimei.new
  RegistrationAddress.create!(
    name: gimei.last.kanji + gimei.first.kanji,
    phone_number: Faker::PhoneNumber.cell_phone,
    postal_code: Faker::Address.postcode,
    address: gimei.address.kanji + '3-20-14',
    customer_id: n + 1
  )
  end
end

#購入履歴
20.times do |n|
  gimei = Gimei.new
  random = Random.new()

  random.rand(5).times do
    Order.create!(
      customer_id: n + 1,
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

disc_id = 1
40.times do |n|
	Product.create!(
		artist_id: Faker::Number.between(from: 1, to: 20),
		record_label_id: Faker::Number.between(from: 1, to: 20),
		category_id: Faker::Number.between(from: 1, to: 20),
		format: Faker::Number.between(from: 1, to: 4),
		title: Faker::Music.album,
		sales_date: Faker::Date.between_except(from: 30.year.ago, to: Date.today, excepted: Date.today),
		price: Faker::Number.between(from: 1000, to: 2000),
		)

  random = Random.new()
  (random.rand(3) + 1).times do |d|
    Disc.create!(
      number: d + 1,
      product_id: n + 1,
      )

      random2 = Random.new()
      (random2.rand(9) + 1).times do |s|
        Song.create!(
        disc_id: disc_id,
        title: Faker::Book.title,
        number: s + 1,
        recording_time_minutes: Faker::Number.between(from: 1, to: 5),
        recording_time_seconds: Faker::Number.between(from: 1, to: 60)
        )
      end
    disc_id += 1
  end
end

15.times do |n|
  PurchasedProduct.create!(
    order_id: n + 1 ,
    product_id: Faker::Number.between(from: 1, to: 10),
    price: Faker::Number.between(from: 1000, to: 5000),
    count: Faker::Number.between(from: 1, to: 3)
    )
end

18.times do |n|
  Arrival.create!(
    product_id: n + 1 ,
    date: Faker::Date.between_except(from: 2.year.ago, to: Date.today, excepted: Date.today), #今日から2年前までの日をランダム
    count: Faker::Number.between(from: 5, to: 50)
    )
end

20.times do |n|
  random = Random.new()
  (random.rand(4) + 1).times do
    CartProduct.create!(
      customer_id: n + 1 ,
      product_id: Faker::Number.between(from: 1, to: 40),
      count: Faker::Number.between(from: 1, to: 3)
      )
  end
end