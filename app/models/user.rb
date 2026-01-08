class User < ApplicationRecord
    has_secure_password

    has_many :user_flights
    has_many :flights, through: :user_flights
    
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def self.authenticate_by(email:, password:)
        user = User.find_by(email: email)
        return user if user&.authenticate(password)
        nil
    end

end
