
class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_enginge, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def booked_dates(space)
        space.bookings.map {|booking| booking.date if booking.status == "Confirmed"}
    end

    def available_period(space)
      (space.start_date..space.end_date)
    end
  end
end
