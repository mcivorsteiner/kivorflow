$(document).ready(function() {
  var sessionView = new SessionView()
  var sessionController = new SessionController(sessionView)
  var questionsView = new QuestionsView()
  var ajaxController = new AjaxController(questionsView)
  sessionController.init()
  ajaxController.init()
});