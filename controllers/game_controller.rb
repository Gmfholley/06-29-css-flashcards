module GameMethods
  
  # generates html for multi_choice question
  #
  # question - Question object
  #
  # return String of html
  def create_multi_choice_question(question)
    html = []
    question.choices.each do |choice|
      html << "<input type = radio name = game[choice] value = '#{choice}'>
                 #{choice} <br>"
    
    end
    html << "<input type = hidden name = game[question] value = '#{question.question}'>"
     html << "<input type = hidden name = game[answer] value = '#{question.answer}'>"
     html << "<input type = hidden name = game[message] value = '#{question.message}'>"
    html.join
  end
  
  # returns a Boolean to indicate if the question is correct
  #
  # returns a Boolean
  def correct_answer?
    params["game"]["choice"] == params["game"]["answer"]
  end
  
  # returns a string telling the user if their answer was correct
  #
  # returns a String
  def tell_user_if_they_are_correct
    if correct_answer?
      "You got the right answer!"
    else
      "Your answer was incorrect."
    end
  end
  
  
end