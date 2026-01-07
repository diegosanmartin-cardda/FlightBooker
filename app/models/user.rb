class User < ApplicationRecord
    has_secure_password

    has_many :user_flights, foreign_key: :passenger_id, dependent: :destroy
    has_many :passenger_flights, through: :user_flights, source: :passenger_flight
    
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def self.authenticate_by(email:, password:)
        user = User.find_by(email: email)
        return user if user&.authenticate(password)
        nil
    end

end
