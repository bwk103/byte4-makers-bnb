require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true, format: :email_address
  property :password, BCryptHash
  attr_accessor :password_confirmation

  validates_confirmation_of :password, confirm: :password_confirmation
  validates_presence_of :email
  validates_uniqueness_of :email


end
