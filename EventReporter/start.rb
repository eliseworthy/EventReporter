#Dependencies
$LOAD_PATH << './'

require "event_data_parser"
require "queue"
require "help"
require "search"
require "event_reporter"

class Start
  EXIT_COMMANDS = ['quit', 'q', 'e', 'exit']
  
  def self.prompt
    printf "Enter command:"
    gets.strip.split
  end

  def self.parse_user_inputs(inputs)
    [ inputs.first.downcase, inputs[1..-1] ]
  end

  def self.switch_by_command(command, parameters)
    if command == "load" #&& EventDataParser.valid_parameters?(parameters)
        @event_reporter.load(parameters[0])
    elsif command == "queue" && Queue.valid_parameters?(parameters)
        @event_reporter.queue.call(parameters)
    elsif command == "help" && Help.valid_parameters?(parameters)
        Help.for(parameters)
    elsif command == "find" && Search.valid_parameters?(parameters)
        @event_reporter.queue.returned_attendees = Search.for(parameters, @event_reporter.all_attendees)
    else
      error_message_for(command)
    end
  end

  def self.error_message_for(command)
    puts "Sorry, invalid parameters for #{command}"
  end

  def self.run
    puts "welcome!"
    command = ""
    @event_reporter = EventReporter.new

    until EXIT_COMMANDS.include?(command)
      inputs = prompt

      if inputs.any?
        command, parameters = parse_user_inputs(inputs) 
        switch_by_command(command, parameters) unless EXIT_COMMANDS.include?(command)
      else
        puts "No command entered."
      end
    end
  end

end

#Script
Start.run