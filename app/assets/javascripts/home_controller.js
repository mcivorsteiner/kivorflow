function HomeController(homeView){
  this.view = homeView
}

HomeController.prototype = {
  init: function(){
    $(this.view.signUpLinkSelector).on('click', this.view.showSignUpForm.bind(this.view))
    $(this.view.commentLinkSelector).on('click', this.view.showCommentForm.bind(this.view))
  }
}