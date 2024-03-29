class PassengerMailer < ApplicationMailer
  default from: 'mclpious@gmail.com'

  def flight_confirmation(passenger=nil)
    if passenger.nil?
      @passenger = params[:passenger]
    else
      @passenger = passenger
    end

    @url = 'http://example.com/login'

    mail(to: @passenger.email, subject: 'Flight Confirmation')
  end
end
