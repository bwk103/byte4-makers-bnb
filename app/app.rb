require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
     erb :index
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/spaces'
   end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    @space = Space.create(title: params[:title], description: params[:description],price: params[:price])
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/login' do
    erb :login
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
      redirect '/login'
    end
  end

  run! if app_file == $0
end
