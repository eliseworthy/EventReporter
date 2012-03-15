#Dependencies
$LOAD_PATH << './'
require 'csv'
require 'attendee'

class EventDataParser

  def self.valid_parameters?(parameters)
    parameters.count == 1 && parameters[0] =~ /\.csv$/
  end

  def self.load(filename)
    puts "Loading the data from #{filename}!"
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.rewind
    file.collect { |line| Attendee.new(line) }
    # attendees.each do |line|
    #   line.first_name
    # end
  end
end