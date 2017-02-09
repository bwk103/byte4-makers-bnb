require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
     erb :index
  end

  post '/signup' do
    if User.first(email: params[:email])
      flash[:errors] = 'Seems that your account already exists! Please try to login...'
      redirect '/users/login'
    else
      user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      session[:user_id] = user.id
      redirect '/spaces'
    end
   end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(title: params[:title], description: params[:description],price: params[:price], user_id: session[:user_id], start_date: params[:start_date], end_date: params[:end_date])
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.get(params[:id])
    @unavailable_dates = Booking.all(:space_id => @space.id, :status => "Confirmed")
    session[:space_id] = params[:id]
    erb :'spaces/space_page'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/users/login' do
    erb :'users/login'
  end

  get '/signout' do
    session[:user_id] = nil
    flash.keep[:notice] = "See you soon!"
    redirect '/spaces'
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:errors] = 'The email or password is incorrect!'
      redirect '/users/login'
    end
  end

  post '/requests' do
    @booking = Booking.new(guest_id: session[:user_id], request_text: params[:text], status: 'Not confirmed', space_id: session[:space_id], date: Date.strptime(params[:date], '%Y-%m-%d'))
    @space = Space.get(@booking.space_id)
    available_dates = (@space.start_date..@space.end_date)
    unavailable_dates = Booking.all(:space_id => @booking.space_id, :status => "Confirmed").map {|booking| booking.date}
    if (available_dates.include? @booking.date) && !(unavailable_dates.include? @booking.date)
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
    if params[:confirm] == 'Confirm'
      booking.status = 'Confirmed'
    elsif params[:deny] == 'Deny'
      booking.status = 'Denied'
    end
    booking.save
    redirect 'users/requests'
  end


  run! if app_file == $0
end
