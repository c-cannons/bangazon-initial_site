# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

customer_ids = []
payment_method_ids = []

##########################################################################################
# MUST CREATE 4 CUSTOMERS MANUALLY TO SEED PROPERLY!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
##########################################################################################
50.times do |f|
    Customer.create([{
        email: Faker::Internet.email,
        password_digest: 123123,
        customer_first_name: Faker::Name.first_name,
        customer_last_name: Faker::Name.last_name,
        street_address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zip: Faker::Address.zip,
        phone_number: Faker::PhoneNumber.phone_number
    }])
end

15.times do |f|
    ProductType.create([{
        product_type_name: Faker::Commerce.unique.department
    }])
end

200.times do |f|
    Product.create([{
        customer_id: rand(1..50), 
        product_type_id: rand(1..15), 
        product_name: Faker::Commerce.product_name, 
        product_price: Faker::Commerce.price,
        product_desc: Faker::Lorem.paragraph,
        quantity: rand(1..50),
        product_location: Faker::Address.city, 
        avatar_file_name: Faker::Fillmurray.image,
        avatar_content_type: 'image/jpg',
        avatar_updated_at: Date.today
    }])
end
    

120.times do |f|
    customer_ids << rand(1..50)
    payment_method_ids << f+1
end

120.times do |f|

    PaymentMethod.create([{
        payment_method_name: Faker::Business.credit_card_type,
        account_number: Faker::Business.credit_card_number,
        customer_id: customer_ids[0]
    }])

    Order.create([{
        customer_id: customer_ids[0],
        payment_method_id: payment_method_ids[f]
    }])

    customer_ids.delete_at(0)
end

500.times do |f|
    OrderDetail.create([{
        order_id: rand(1..120),
        product_id: rand(1..200)
    }])
end



