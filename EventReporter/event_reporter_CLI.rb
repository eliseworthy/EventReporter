#Dependecies
#Class Definition

class EventReporterCLI

  def self.run
    puts "welcome!"
    command = ""
    
    while command != "quit"
      printf "enter command: "

      input = gets.chomp
      parts = input.split(" ")
      command = parts[0].downcase
      second_command = parts[1]

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
    puts "You loaded #{filename}!"
  end

  def self.help_list
    puts "here are all the commands"
  end

  def self.help(command)
    puts "here's the info for the #{command} command"
  end

  def self.find(attribute, criteria)
    puts "I'm putting all #{criteria}s with #{attribute} in the queue"
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
            #     when 'count' then queue_count
        #     when 'clear' then queue_clear
        #     when 'save' then queue_save_to(filename)
        #     when 'print'
        #         if filename.nil?
        #          print
        #         else
        #          print(filename)
  end
end

#Script
EventReporterCLI.run
