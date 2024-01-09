class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new(flight: @flight)
    @tickets = params[:booking][:tickets].to_i
    params[:booking][:tickets].to_i.times { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each { |passenger| PassengerMailer.with(passenger: passenger).flight_confirmation.deliver_later }
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email] )
  end
end

# Once your form is successfully submitted, render the booking’s #show page which 
# displays the booking information (flight and passenger information).
