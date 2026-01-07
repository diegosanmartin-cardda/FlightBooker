class BookingsController < ApplicationController

    before_action :is_logged_in?
    
    def new
        @flight = Flight.find(params[:flight_id])
    end

    def create
        @flight = Flight.find(params[:flight_id])
        @user = current_user
        Rails.logger.info "Booking flight #{@flight.id} for user #{@user.id}"
        @booking = @user.
        if @booking.save
            redirect_to root_path, notice: "Flight booked successfully."
        else
            Rails.logger.error "Failed to book flight: #{@booking.errors.full_messages.join(", ")}"
            render :new, status: :unprocessable_entity
        end
    end
end
