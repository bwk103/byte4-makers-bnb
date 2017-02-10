
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

    def create_tags(space)
      Tag.create(name: params[:pet_friendly], space_id: space.id )
      Tag.create(name: params[:house], space_id: space.id )
      Tag.create(name: params[:has_a_pool], space_id: space.id )
      Tag.create(name: params[:wifi], space_id: space.id )
      Tag.create(name: params[:flat], space_id: space.id )
      Tag.create(name: params[:central], space_id: space.id )
      Tag.create(name: params[:has_a_fireplace], space_id: space.id )
    end

    def string_to_date(date_string)
      date_string
      Date.strptime(date_string, "%Y-%m-%d")
    end

    def date_to_string(date)
      date.strftime("%d/%m/%Y")
    end
  end
end
