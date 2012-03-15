class Help

  ALL_COMMANDS = {"load" => "loads a new file",
                  "help" => "shows a list of available commands",
                  "queue" => "a set of data",
                  "queue count" => "total items in the queue",
                  "queue clear" => "empties the queue",
                  "queue print" => "prints to the queue",
                  "queue print by" => "prints the specified attribute",
                  "queue save to" => "exports queue to a CSV",
                  "find" => "load the queue with matching records",
                  "exit" => "exits the program"}

  def self.valid_parameters?(parameters)
    parameters.empty? || valid_command?(parameters.join(" "))
  end

  def self.valid_command?(parameters)
    ALL_COMMANDS.include? parameters
  end

  def self.for(parameters)
    if parameters.empty?
      help_list
    else
      puts ALL_COMMANDS[parameters.join(" ")]
    end
  end

  def self.help_list
    puts "EventReporter has the following commands:"

    ALL_COMMANDS.keys.each do |command|
      puts command
    end
  end
end