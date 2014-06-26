$(document).ready(function() {
  var sessionController = new SessionController( new SessionView() )
  var questionController = new QuestionController( new QuestionsView() )
  sessionController.init()
  questionController.init()
});