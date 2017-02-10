class MakersBnB < Sinatra::Base

  post '/requests' do
    @booking = Booking.new(guest_id: session[:user_id], request_text: params[:text], status: 'Not confirmed', space_id: session[:space_id], date: Date.strptime(params[:date], '%Y-%m-%d'))
    @space = Space.get(@booking.space_id)
    if @space.is_available_on(@booking.date)
      @booking.save
      redirect 'users/requests'
    else
      flash.now[:errors] = 'Unavailable Date.'
      erb :'spaces/space_page'
    end
  end

  get '/users/requests' do
    @bookings = Booking.all
    erb :'users/requests'
  end

  get '/users/requests/confirmation/:id' do
    @booking = Booking.get(params[:id])
    session[:booking_id] = @booking.id
    erb :'users/confirm_booking'
  end

  post '/users/requests/confirmation/confirm' do
    booking = Booking.get(session[:booking_id])
    booking.booking_confirmation(params[:confirm] || params[:deny])
    # if params[:confirm] == 'Confirm'
    #   booking.status = 'Confirmed'
    # elsif params[:deny] == 'Deny'
    #   booking.status = 'Denied'
    # end
    booking.save
    redirect 'users/requests'
  end

end
