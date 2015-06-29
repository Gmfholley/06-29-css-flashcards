class FlashCardGame
  attr_reader :model
  
  # model - Class of the model we are working with
  
  def initialize(model, num_choices=4)
    @model = model
    @num_choices = num_choices
  end
  
  # returns a random question
  #
  # returns a Question object
  def create_question_from_object
    q = sample_question
    more_choices = [q.answer]
    (2..@num_choices).each do |x|
      more_choices << sample_question.answer
    end
    Question.new(question: q.question, answer:q.answer, choices: more_choices, message: q.message )
  end
  
  # returns a single object from all
  #
  # returns a single object
  def sample_question
    get_all_from_database.sample
  end
  
  # returns an Array of all objects from the database
  #
  # returns an Array
  def get_all_from_database
    model.all
  end
  
  

end