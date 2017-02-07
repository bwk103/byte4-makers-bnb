class Booking

  property :id,             Serial
  property :guest_id,       Fixnum
  propert :status,          String
  property :request_text,   Text

  belongs_to :space

end
