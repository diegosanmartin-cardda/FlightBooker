class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport,  class_name: "Airport"

  has_many :user_flights, foreign_key: :passenger_flight_id, dependent: :destroy
  has_many :passengers, through: :user_flights

  scope :upcoming, -> { where("departure >= ?", Time.now).order(departure: :asc) }
  scope :now , -> { where("departure >= ?", Time.now) }

  scope :by_departure_airport, ->(airport_id) { where(departure_airport_id: airport_id) if airport_id.present? }
  scope :by_arrival_airport, ->(airport_id) { where(arrival_airport_id: airport_id) if airport_id.present? }
  scope :by_departure_date, ->(date) {
    if date.present?
      where(departure: DateTime.parse(date).beginning_of_day..DateTime.parse(date).end_of_day)
    end
  }

  def display_label
    "#{departure_airport.location} → #{arrival_airport.location} (#{departure.strftime('%Y-%m-%d %H:%M')})"
  end

end
