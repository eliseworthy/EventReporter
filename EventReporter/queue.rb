class Queue

  attr_accessor :returned_attendees

  def initialize
    @returned_attendees = []
  end

  def self.valid_parameters?(parameters)
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

  def count
    puts "There are #{@returned_attendees.size} entries."
  end

  def clear
    @returned_attendees = []
    puts "The queue is clear."
  end
  
  def call(parameters)
    if parameters[0] == "count"
      count
    elsif parameters[0] == "clear"
      clear
    elsif parameters[0] == "save"
      save(parameters[2]) 
      puts  "The file has been saved to #{parameters[2]}"
    elsif parameters[0] == "print" && parameters[2].nil?
      print_to_screen    
    elsif parameters[0] == "print"
      sort_by(parameters[2])
      print_to_screen
    end
  end  

  def save(filename)
    output = CSV.open(filename, "w") do |row|
      row << ["LAST NAME", "FIRST NAME", "EMAIL",  "ZIPCODE",  "CITY",  "STATE",  "ADDRESS"]
      @returned_attendees.each do |attendee|
        row << attendee.table_values
      end
    end
  end

  def print_to_screen
    puts "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\n"
    @returned_attendees.each do |attendee|
      puts attendee.table_values.join("\t")
      puts "\n"
    end
  end

  def sort_by(parameter)
    @returned_attendees = @returned_attendees.sort_by{|attendee| attendee.send(parameter)}
  end

  # call("count")

  
  # def call(params)
  #   puts "Running Queue sub-function #{params[0]}"    
  # end

  # def call(params)
  #   puts "Running Queue sub-function #{params[0]}"    
  # end

  # def call(params)
  #   puts "Running Queue sub-function #{params[0]}"    
  # end

#   queue count

# Output how many records are in the current queue
# queue clear

# Empty the queue
# queue print

# Print out a tab-delimited data table with a header row following this format:

# 1

  

# LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS

# queue print by <attribute>

# Print the data table sorted by the specified attribute like zipcode.
# queue save to <filename.csv>
end