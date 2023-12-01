class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:booking][:flight_id] )
    @flight = Flight.find(params[:booking][:flight_id])
    params[:booking][:tickets].to_i.times { @booking.passengers.build }
  end

  def create

  end

  private

  def booking_params
    params.require(:booking).permit(:tickets, :flight_id, passengers_attributes: [:name, :email] )
  end
end
