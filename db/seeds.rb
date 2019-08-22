class Seed
  def self.begin
    Review.destroy_all
    Destination.destroy_all
    seed = Seed.new
    seed.generate_destinations
  end
  def generate_destinations
    50.times do |i|
      destination = Destination.create!(
        destination: Faker::Space.star_cluster,
        city: Faker::Games::Pokemon.location,
        country: Faker::Address.country
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
