class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:booking][:flight_id] )
    @flight = Flight.find(params[:booking][:flight_id])
    params[:booking][:tickets].to_i.times { @booking.passengers.build }
  end

  #Need to make efficient create action
  def create
    @booking = Booking.new
    @booking.flight = @flight

    params[:booking][:passengers_attributes].each do |x|
      puts x
    end

  end

  private
#Need to make sure the way the form is submitting the params is efficient for the create action
  def booking_params
    params.require(:booking).permit(:tickets, :flight_id, passengers_attributes: [:name, :email] )
  end
end
