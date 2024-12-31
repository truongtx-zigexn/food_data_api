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

puts "Seeding completed!"
