class Seed
  def self.begin
    Destination.destroy_all
    Review.destroy_all
    seed = Seed.new
    seed.generate_destinations
  end
  def generate_destinations
    25.times do |i|
      destination = Destination.create!(
        destination: Faker::Games::Pokemon.location,
        city: Faker::Nation.capital_city,
        country: Faker::Games::Pokemon.location
      )
      puts "Destination #{i}: City is #{destination.city} and country is #{destination.country}."
      rand(30...273).times do |x|
        review = destination.reviews.create!(
          name: Faker::FunnyName.name,
          text_body: Faker::GreekPhilosophers.quote
        )
        puts "Review #{x}: User is #{review.name}, text is #{review.text_body}."
      end
    end
  end
end

Seed.begin
