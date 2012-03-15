class EventReporter
  attr_accessor :all_attendees, :queue 

  def initialize(filename="event_attendees.csv")
    @queue = Queue.new
    load(filename)
  end

  def load(filename)
    @all_attendees = EventDataParser.load(filename)
  end

end