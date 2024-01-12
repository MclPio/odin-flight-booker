class FlightsController < ApplicationController
  #"/flights?departure_airport=YYZ&arrival_airport=YVR&date=20231126&passengers=1&commit=Search"

  def index
    @flights = Flight.includes(:departure_airport, :arrival_airport).all
    @departure_flight_options = @flights.map { |f| [f.departure_airport.code, f.departure_airport_id] }.uniq
    @arrival_flight_options = @flights.map { |f| [f.arrival_airport.code, f.arrival_airport_id] }.uniq
    @passenger_options = [[1, 1], [2, 2], [3, 3], [4, 4]]
    @date_options = @flights.map { |f| [f.start_datetime.strftime("%m/%d/%Y") , f.start_datetime.strftime("%Y%m%d")] }.uniq

    if params[:commit].present?
      @available_flights = available_flights
      @passengers = params[:flight][:num_tickets]
      @selected_departure_airport = params[:flight][:departure_airport_id]
      @selected_arrival_airport = params[:flight][:arrival_airport_id]
      @selected_date = params[:flight][:date]
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_code, :arrival_code, :date, :num_tickets, :commit)
  end

  def available_flights
    selected_date = Date.parse(params[:flight][:date])
    start_of_day = selected_date.beginning_of_day
    end_of_day = selected_date.end_of_day

    flight_options = @flights.where("departure_airport_id = ? AND arrival_airport_id = ? AND start_datetime BETWEEN ? AND ?",
                                    params[:flight][:departure_airport_id], params[:flight][:arrival_airport_id],
                                    start_of_day, end_of_day)
  end
end
