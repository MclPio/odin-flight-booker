# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def seed_airport
  airport_codes = %w[YYZ YVR YUL YYC YEG]
  airport_codes.each do |airport|
    Airport.create(code: airport)
  end
end

def seed_flights
  # Airport.all.each_slice(2) do |airport_1, airport_2|
  #   flight_duration = rand(1..8)
  #   start_datetime = rand(1.month).seconds.from_now
  #   flight = Flight.new(flight_duration: flight_duration, start_datetime: start_datetime)
  #   flight.departure_airport = airport_1
  #   flight.arrival_airport = airport_2
  #   flight.save
  # end

  Airport.all.each do |airport1|
    Airport.all.reverse.each do |airport2|
      flight_duration = rand(1..8)
      start_datetime = rand(1.month).seconds.from_now
      flight = Flight.new(flight_duration: flight_duration, start_datetime: start_datetime)
      flight.departure_airport = airport1
      flight.arrival_airport = airport2
      flight.save
    end
  end
end

seed_airport
seed_flights
