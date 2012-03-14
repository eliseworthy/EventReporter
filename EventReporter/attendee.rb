# class ZipCode
#   def self.clean(dirty_zipcode)
#     dirty_zipcode.to_s.rjust(5, '0')
#   end
# end

# class PhoneNumber
#   def initialize(phone_number)
#     @phone_number = phone_number.scan(/\d/).join
#   end

#   def to_s
#     "(#{@phone_number[0..2]}) #{@phone_number[3..5]}-#{@phone_number[6..-1]}"
#   end
# end

class Attendee 

  attr_accessor :first_name, :last_name, :email, :zipcode, :city, :state, :address

  def initialize(attributes)
    self.first_name = attributes[:first_name]
    #need to call clean methods - self.phonenumber = clean_number(attribltes[:homephone])
    self.last_name = attributes[:last_name]
    self.email = attributes[:email]
    self.zipcode = attributes[:zipcode]
    self.city = attributes[:city]
    self.state = attributes[:state]
    self.address = attributes[:address]
  end

  #need to put a data cleaner here
  # def full_name
  #   [first_name, last_name].join(" ") 
  # end  

  # def zipcode
  #   ZipCode.clean(super)
  # end

  # def phone_number
  #   PhoneNumber.new(homephone)
  # end

end
