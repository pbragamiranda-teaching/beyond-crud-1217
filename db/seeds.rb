puts "cleaning db.."

Restaurant.destroy_all

puts "populating db.."

50.times do 
  new_restaurant = Restaurant.new(name: Faker::TvShows::RuPaul.queen,
                                  address: Faker::Address.full_address,
                                  rating: rand(1..5),
                                  chef_name: ['Victor Lima', 'Gordon R.', 'Remi the Rat', 'Jame Oliver'].sample)

  if new_restaurant.save
    puts "#{new_restaurant.id} was created.."
  end
end

puts "done"