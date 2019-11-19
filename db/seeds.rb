# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  gimei = Gimei.new
  Customer.create!(
    last_name: gimei.last.kanji,
    first_name: gimei.first.kanji,
    last_name_read: gimei.last.hiragana,
    email: Faker::Internet.email,
    postal_code: Faker::Address.postcode,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: gimei.address.kanji,
    password: 123456
)
end

20.times do
   gimei = Gimei.new
   RegistrationAddress.create!(
    name: gimei.last.kanji + gimei.first.kanji,
    phone_number: Faker::PhoneNumber.cell_phone,
    postal_code: Faker::Address.postcode,
    address: gimei.address.kanji,
    customer_id: Faker::Number.between(from: 1, to: 20)
    )
end

30.times do
   gimei = Gimei.new
   Order.create!(
    customer_id: Faker::Number.between(from: 1, to: 20),
    status: Faker::Number.between(from: 1, to: 3),
    payment_method: Faker::Number.between(from: 1, to: 3),
    total_amount: Faker::Number.between(from: 4000, to: 8000),
    subtotal_amount: Faker::Number.between(from: 1000, to: 2000),
    contractee_name: gimei.last.kanji + gimei.first.kanji,
    contractee_phone_number: Faker::PhoneNumber.cell_phone,
    postal_code: Faker::Address.postcode,
    destination_name: gimei.last.kanji + gimei.first.kanji,
    destination_address: gimei.address.kanji,
    destination_phone_number:Faker::PhoneNumber.cell_phone,
    postage: 500
    )
end

