class UserFlight < ApplicationRecord
  belongs_to :passenger, class_name: 'User'
  belongs_to :passenger_flight, class_name: 'Flight'
end
