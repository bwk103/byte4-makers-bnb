require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  
  get '/' do
    'Hello MakersBnB!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
