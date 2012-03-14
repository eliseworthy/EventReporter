#Dependecies

$LOAD_PATH << './'
require 'csv'
require 'attendee'
require 'help'
require 'search'
require 'event_data_parser'
require 'queue'

#Class Definition

class EventReporterCLI
  EXIT_COMMANDS = ['quit', 'q', 'e', 'exit']
  ALL_COMMANDS = {"load" => "loads a new file", 
                  "help" => "shows a list of available commands",
                  "queue" => "a set of data",
                  "queue count" => "total items in the queue", 
                  "queue clear" => "empties the queue",
                  "queue print" => "prints to the queue", 
                  "queue print by" => "prints the specified attribute",
                  "queue save to" => "exports queue to a CSV", 
                  "find" => "load the queue with matching records"}

  class << self
    attr_accessor :attendees
  end

  def self.prompt
    printf "Enter command:"
    gets.strip.split
  end

  def self.parse_user_inputs(inputs)
    [ input.first.downcase, inputs[1..-1] ]
  end

  def self.valid_parameters_for_load?(parameters)
    parameters.count == 1 && parameters[0] =~ /\.csv$/
  end

  def self.valid_parameters_for_queue?(parameters)
    if !%w(count clear print save).include?(parameters[0])
      false
    elsif parameters[0] == "print" 
      parameters.count == 1 || (parameters[1] == "by" && parameters.count == 3 )
    elsif parameters[0] == "save"
      parameters[1] == "to" && parameters.count == 3
    else
      true
    end
  end

  def self.valid_parameters_for_help?(parameters)
    parameters.empty? || valid_command?(parameters.join(" "))
  end

  def self.valid_command?(command)
    ALL_COMMANDS.keys.include?(command)
  end

  def self.switch_by_command(command, parameters)
    if command == "load" && valid_parameters_for_load?(parameters)
        EventDataParser.load(parameters[0])
    elsif command == "queue" && valid_parameters_for_queue?(parameters)
        Queue.new.call(parameters)
    elsif command == "help" && valid_parameters_for_help?(parameters)
        Help.for(parameters)
    elsif command == "find" && Search.valid_parameters?(parameters)
        Search.for(parameters)
    else
      error_message_for(command)
    end
  end

  def self.run
    puts "welcome!"
    command = ""
    load_attendees("event_attendees.csv")

    until EXIT_COMMANDS.include?(command)
      inputs = prompt

      if inputs.any?
        command, parameters = parse_user_inputs(inputs)
        switch_by_command(command, parameters)
      else
        puts "No command entered."
      end
    end
  end

  def self.load_attendees(filename)
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.rewind
    attendees = file.collect { |line| Attendee.new(line) }
    puts attendees.inspect
  end

  def self.error_message_for(command)
    puts "Sorry, invalid parameters for #{command}"
  end

end

#Script
EventReporterCLI.run
