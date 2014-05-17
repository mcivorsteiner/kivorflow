$(document).ready(function() {
  var homeView = new HomeView()
  var homeController = new HomeController(homeView)
  homeController.init()
  console.log(homeController)
});