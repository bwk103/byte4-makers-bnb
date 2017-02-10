class MakersBnB < Sinatra::Base

  get '/home' do
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

end
