class Search

  def self.valid_parameters?(parameters)
    parameters.count >= 2
  end

  def self.for(parameters, attendees)
    @attendees_to_search = attendees
    @attendees_to_save = []

    puts "You're doing a search for #{parameters[1..-1].join(" ")} in category #{parameters[0]}"

    @attendees_to_search.each do |attendee|
      value = attendee.send(parameters[0])
      if value && value.downcase == parameters[1..-1].join(" ").downcase
        @attendees_to_save.push(attendee)
      end
    end
    puts "We found #{@attendees_to_save.size} that match."
    return @attendees_to_save
  end
end