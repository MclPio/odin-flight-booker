# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Useful for resets
# rake db:reset db:seed

def seed_airport
  airport_codes = %w[YYZ YVR YUL YYC YEG]
  airport_codes.each do |airport|
    Airport.create(code: airport)
  end
end

def start_datetime_gen(days)
  time_next_month = Time.now + days.day
  time_next_month.strftime "%Y-%m-%d #{%w[00 06 12 18].sample}: #{%w[00 30 45].sample}: 00"
end

def seed_flights
  future_dates = [1, 6, 9, 14, 21, 28, 35, 42, 49]

  future_dates.each do |d|
    Airport.all.each do |airport1|
      Airport.all.reverse.each do |airport2|
        flight_duration = rand(1..5)
        flight = Flight.new(flight_duration: flight_duration, start_datetime: start_datetime_gen(d))
        if airport1 == airport2
          next
        else
          flight.departure_airport = airport1
          flight.arrival_airport = airport2
          flight.save
        end
      end
    end
  end
end

seed_airport
seed_flights

#testing new model:
# passenger_1 = Passenger.create(name: 'bob', email: 'bob@world.co')
# booking_1 = Booking.create.flight = Flight.first