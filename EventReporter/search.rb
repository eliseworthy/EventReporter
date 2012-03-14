class Search

  def self.valid_parameters?(parameters)
    parameters.count == 2
  end
  def self.for(parameters)
    puts "Here's a search for #{parameters}"
  end
end