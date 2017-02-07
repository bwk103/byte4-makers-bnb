require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id,           Serial
  property :title,        String
  property :description,  Text
  property :price,        Float

  belongs_to :user
  has n, :bookings

end
