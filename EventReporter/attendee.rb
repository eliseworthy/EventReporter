class Attendee 

  attr_accessor :first_name, :last_name, :email, :zipcode, :city, :state, :address

  def initialize(attributes)
    self.first_name = attributes[:first_name]
    #need to call clean methods - self.phonenumber = clean_number(attribltes[:homephone])
    self.last_name = attributes[:last_name]
    self.email = attributes[:email_address]
    self.dirty_zipcode = attributes[:zipcode]
    self.city = attributes[:city]
    self.state = attributes[:state]
    self.address = attributes[:street]
  end

  def table_values
    [
      last_name,
      first_name,
      email,
      zipcode,
      city,
      state,
      address
    ]
  end

  def dirty_zipcode=(dirty_zipcode)
    self.zipcode = dirty_zipcode.to_s.rjust(5, '0')
  end
end
