#Dependecies
$LOAD_PATH << './'
require 'csv'
require 'attendee'
require 'help'
require 'search'

#Class Definition

class EventReporterCLI
  class << self
    attr_accessor :attendees
  end

  def self.run
    puts "welcome!"
    command = ""
    #load_this("event_attendees.csv")
    
    while command != "quit"
      printf "enter command: "

      input = gets.chomp
      parts = input.split(" ")
      command = parts[0].downcase
      second_command = parts[1]
      @input = input
      @second_command = second_command
      @attribute = parts[2]

      case command
        when 'quit' then puts "Adios!"
        when 'load' then load_this(second_command)
        when 'help'
          if second_command.nil?
            help_list
          else
            help(second_command)
          end
        when 'find' then find(second_command, parts[2])
        when 'queue' then 
          if second_command == "save" && parts[3] != nil
            queue_save(parts[3])
          elsif second_command == "print" && parts[3] != nil
            queue_print_by(parts[3])
          else
            queue(second_command)
          end
        else puts "That command is invalid."
      end
    end
  end

  def self.load_this(filename)
    # This works - I just want to test with a small amount of data for a bit
    # puts "You loaded #{filename}!"
    # file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    # file.rewind
    # attendees = file.collect { |line| Attendee.new(line) }
    # puts attendees.inspect
  end

  def self.help_list
  
    puts "Here's a list of the commands:"
    puts "load <filename>" 
    puts "help"
    puts "help <command name>" 
    puts "find <attribute> <criteria>"
    puts "queue count"
    puts "queue clear"
    puts "queue print"
    puts "queue print by <attribute>"
    puts "queue save to <filename>"

  end

  def self.help(command)
    Help.for(@input)
  end

  def self.find(attribute, criteria)
    Search.for(@attribute, @second_command)
  end

  def self.queue_print_by(attribute)
    puts "You're asking to print by #{attribute}"
  end

  def self.queue_save(filename)
    puts "You're asking to save the queue to #{filename}"
  end

  def self.queue(command)
    if command == "count" 
      puts "there are some number of things in your queue"
    elsif command == "print" 
      puts "I'm going to print the whole queue"
    elsif command == "clear" 
      puts "I'm clearing yo' queue"
    else 
      puts "Invalid queue command."
    end
  end
end

#Script
EventReporterCLI.run
