class FlightsController < ApplicationController
    before_action :is_logged_in?
    
    def index
        @flights = Flight.all

        Rails.logger.info 

        @flights = @flights.by_departure_airport(params[:departure_airport_id])
        @flights = @flights.by_arrival_airport(params[:arrival_airport_id])
        @flights = @flights.by_departure_date(params[:departure_date])

        @user = current_user
    end
end
