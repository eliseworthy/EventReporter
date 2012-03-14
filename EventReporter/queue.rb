class Queue

  attr_accessor :returned_attendees

  def initialize
    @returned_attendees = []
  end

  # trying to make the below work
  # @queue = [{:first_name => "john", :last_name => "smith"}, {:first_name => "sally", :last_name => "struthers"} ]
  
  # # def call(parameters)
  #   if parameters == "count"
  #       puts "we're counting!"
  #   elsif parameters == "clear"
  #       puts "we're clearing the queue!"
  #   elsif parameters == "print"
  #       # if parameters[1].nil?
  #       #   puts "print it unsorted"
  #       # else 
  #       puts  "sort the queue by param[1]"
  #       puts  "then do the print method"
  #       # end
  #   end
  # end  

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