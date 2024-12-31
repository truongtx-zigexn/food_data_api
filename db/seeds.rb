require "open-uri"

puts "Seeding Meals with Images..."

Meal.find_each do |meal|
  return if meal.attached?

  image_path = Rails.root.join("db/seeds/images", "#{meal.id}.jpg")

  if File.exist?(image_path)
    meal.image.attach(
      io: File.open(image_path),
      filename: "#{meal.id}.jpg",
      content_type: "image/jpeg",
    )
    puts "Attached image for meal ##{meal.id}"
  else
    puts "No image found for meal ##{meal.id}"
  end
end

user = User.create! username: "Team_16", full_name: "Team 16", password: 123
PhysicalStat.create! user: user, gender: :male, height: 170, weight: 70, activity_lvl: :moderate,goal_calories: 2000, age: 21

puts "Seeding completed!"
