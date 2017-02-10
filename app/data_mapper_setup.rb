require 'data_mapper'
# require 'database_cleaner'
require 'dm-postgres-adapter'
# require 'dm-validations'
# require 'dm-transactions'

# require 'sinatra/base'
# require 'sinatra/flash'
#
# require 'encrypted_cookie'
# require 'bcrypt'
# require 'carrierwave/datamapper'
#
# require 'pry'

require './app/models/user'
require './app/models/space'
require './app/models/booking'
require './app/models/tag'
require './app/models/picture'


# env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade! # !!!!
