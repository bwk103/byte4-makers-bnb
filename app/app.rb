require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do

  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    @space = Space.create(title: params[:title], description: params[:description],price: params[:price])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
