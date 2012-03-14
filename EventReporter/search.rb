class Search

  def self.valid_parameters?(parameters)
    parameters.count == 2
  end
  def self.for(parameters, attendees)
    @attendees_to_search = attendees
    @attendees_to_save = Queue.new
      #go through each item in attendees_to_search
    puts "You're doing a search for #{parameters[1]} in category #{parameters[2]}" 
    
    @attendees_to_search.each do |attendee|     
      @attendees_to_save.push(attendee) if attendee.send(parameters[0]) == parameters[1]
    end 
    puts "We found #{@attendees_to_save.size} that match."
  end
end