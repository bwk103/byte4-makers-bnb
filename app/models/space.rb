require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/flash'

class Space
  include DataMapper::Resource

  property :id,           Serial
  property :title,        String
  property :description,  Text
  property :price,        Float
  property :start_date,   Date
  property :end_date,     Date

  belongs_to :user
  has n, :bookings
  has n, :tags
  has n, :pictures

  def available_dates
    (self.start_date..self.end_date)
  end

  def unavailable_dates
    self.bookings.all(:space_id => self.id,
                     :status => "Confirmed").map {|booking| booking.date}
  end

  def is_available_on(date)
    (self.available_dates.include? date) &&
    !(self.unavailable_dates.include? date)
  end
  
end
