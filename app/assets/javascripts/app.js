$(document).ready(function() {
  var homeView = new HomeView()
  var homeController = new HomeController(homeView)
  var questionsView = new QuestionsView()
  var ajaxController = new AjaxController(questionsView)
  homeController.init()
  ajaxController.init()
});