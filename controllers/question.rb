class Question
  
  attr_reader :question, :answer, :choices, :message
  
  
  def initialize(args)
    @question = args["question"] || args[:question]
    @answer = args["answer"] || args[:answer]
    @choices = args["choices"] || args[:choices]
    @message = args["message"] || args[:message]
    add_answer_to_choices_if_not_already
  end
  
  
  def add_answer_to_choices_if_not_already
    if !answer_is_member_of_choices?
      add_answer_to_choices
    end
  end
  
  def answer_is_member_of_choices?
    choices.include?(answer)
  end
  
  def add_answer_to_choices
    choices << answer
  end

  

end