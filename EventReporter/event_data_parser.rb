class EventDataParser
  def self.load(filename)
    puts "Loading the data from #{filename}!"
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.rewind
    attendees = file.collect { |line| Attendee.new(line) }
    # attendees.each do |line|
    #   line.first_name
    # end
  end
end