ENV['RACK_ENV'] ||= 'development'


require 'sinatra/partial'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/requests'
require_relative 'controllers/spaces'
require_relative 'controllers/users'

class MakersBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
    use Rack::MethodOverride

  get '/' do
     redirect '/home'
  end
  
  run! if app_file == $0
end
