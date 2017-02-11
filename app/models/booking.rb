class Booking
  include DataMapper::Resource

  property :id,             Serial
  property :guest_id,       Integer
  property :status,         String
  property :request_text,   Text
  property :date,           Date

  belongs_to :space

  def booking_confirmation(response)
    if response == 'Confirm'
      self.status = 'Confirmed'
    elsif response == 'Deny'
      self.status = 'Denied'
    end
  end

end
