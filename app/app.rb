require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    'Hello MakersBnB!'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    
    redirect '/'
    end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
