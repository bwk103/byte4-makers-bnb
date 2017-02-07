require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    @spaces = Space.all
    erb :index
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    @space = Space.create(title: params[:title], description: params[:description],price: params[:price])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
