# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

['NYC', 'LAX', 'SFO', 'CHI', 'MIA'].each do |code|
  Airport.find_or_create_by!(location: code)
end

Flight.find_or_create_by!(departure_airport: Airport.find_by(location: 'NYC'),
                           arrival_airport: Airport.find_by(location: 'LAX'),
                           departure: '2024-07-01 08:00',
                           duration: 120)
Flight.find_or_create_by!(departure_airport_id: Airport.find_by(location: 'SFO')[:id],
                           arrival_airport_id: Airport.find_by(location: 'CHI')[:id],
                           departure: '2024-07-02 09:00',
                           duration: 360)
Flight.find_or_create_by!(departure_airport_id: Airport.find_by(location: 'MIA')[:id],
                           arrival_airport_id: Airport.find_by(location: 'NYC')[:id],
                           departure: '2024-07-03 10:00',
                           duration: 180)
Flight.find_or_create_by!(departure_airport_id: Airport.find_by(location: 'LAX')[:id],
                           arrival_airport_id: Airport.find_by(location: 'SFO')[:id],
                           departure: '2024-07-04 14:00',
                           duration: 90)