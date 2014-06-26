$(document).ready(function() {
  var sessionController = new SessionController( new SessionView() )
  var ajaxController = new AjaxController( new QuestionsView() )
  sessionController.init()
  ajaxController.init()
});