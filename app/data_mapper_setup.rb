require 'data_mapper'
require 'database_cleaner'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-transactions'

require 'sinatra/base'
require 'sinatra/flash'

require 'encrypted_cookie'
require 'bcrypt'

require 'pry'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
