require 'ruby-debug'
class Attendee 

  attr_accessor :first_name, :last_name, :email, :zipcode, :city, :state, :address, :homephone

  def initialize(attributes)
    self.first_name = attributes[:first_name]
    self.last_name = attributes[:last_name]
    self.email = attributes[:email_address]
    self.dirty_zipcode = attributes[:zipcode]
    self.city = attributes[:city]
    self.state = attributes[:state]
    self.address = attributes[:street]
    attributes[:homephone] = '' if attributes[:homephone].nil?
    self.dirty_phone = attributes[:homephone]
  end

  def table_values
    [
      last_name,
      first_name,
      email,
      zipcode,
      city,
      state,
      address,
      homephone,
    ]
  end

  def dirty_zipcode=(dirty_zipcode)
    self.zipcode = dirty_zipcode.to_s.rjust(5, '0')
  end

  def dirty_phone=(dirty_phone)
    dirty_phone = dirty_phone.scan(/\d/).join
    if dirty_phone.length == 10
      dirty_phone = dirty_phone
    elsif dirty_phone.length == 11 && dirty_phone[0] == 1 
       dirty_phone = dirty_phone[1..-1]
     else
      dirty_phone = "0000000000"
    end
    formatted_phone = "(#{dirty_phone[0..2]}) #{dirty_phone[3..5]}-#{dirty_phone[6..-1]}"
    self.homephone = formatted_phone
  end
end
