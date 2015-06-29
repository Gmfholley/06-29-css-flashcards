class CSSDefinition
    
  include DatabaseConnector

  # duration - length
  attr_reader :id, :errors
  attr_accessor :definition, :example, :name

  # initializes a Duration id
  #
  # optional Hash argument
  #         name              - String of the name
  #         definition        - String of the definition
  #         example           - String of an example
  #         id                - Integer of the id
  #
  # returns an instance of the object
  def initialize(args={})
    @id = args["id"]
    @name = args[:name] || args["name"]
    @definition = args[:definition] || args["definition"]
    @example = args[:example] || args["example"]
    @errors = []
    post_initialize
  end

  def to_s
    "id: #{id}\t\tname: #{name}\t\texample: #{example}"
  end

  # returns Boolean if data is valid
  #
  # returns Boolean
  def valid?
    @errors = []
    # checks each field type and adds error messages if it does not meet requirements from the table
    validate_field_types
    @errors.empty?
  end
  
  def question
    "What is the definition of #{name}?"
  end
  
  def answer
    definition
  end
  
  def message
    example
  end
  
end