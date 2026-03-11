# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# 50.times do |index|
#   BlogPost.create(title: "Rugby Boy Number #{index}", content: "Test blog post", published_at: Time.current)
# end

# 10.times do |index|
#   BlogPost.create(title: "Sample Blog Post", content: "This is a sample blog post to test pagination", published_at: Time.now )
# end


# 20.times do
#   BlogPost.where(title: "Sample Blog Post")

# end