require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
