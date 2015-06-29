#FlashCard Game

This creates a cool little multiple choice game.

The main menu directs you either to the game or to a place where you can update the database for the game questions.  In this case, the game questions are related to css definitions.

A FlashCardGame has a model it is using to create the game and a number of choices to be used in each of the multiple-choice questions.  num_choices defaults to 4.

```ruby
  # initializes object
  #
  # model         - Class of the model we are working with
  # num_choices   - optional Integer, defaults to 4
  #
  def initialize(model, num_choices=4)
    @model = model
    @num_choices = num_choices
  end
```

The FlashCardGame will get all of the model's objects (all models should include the DatabaseConnector module so that they have proper database functionality).  Then it has a sample method.

To create a question, FlashCardGame samples from all of the objects to get the question/answer and samples again to get the other choices.  The model should have `question`, `answer`, and `message` methods that return values that make sense.

```ruby
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
```

`create_question_from_object` returns a Question object which stores these variables.

To play the game, there are two erb files, one that displays the question and all the choices, and a second erb file that shows whether the answer was correct and displays any other messages.

As with my other Sinatra projects, I use Menu, MenuItem, and MethodToCall objects to help dynamically create my create/menu view files.  These classes are stored in the controllers folder.

###To do

Might want to keep score and offer an option to have write-in response instead of a multiple choice.