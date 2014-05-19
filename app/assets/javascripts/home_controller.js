function HomeController(homeView){
  this.view = homeView
}

HomeController.prototype = {
  init: function(){
    $(this.view.signUpLinkSelector).on('click', this.view.showSignUpForm.bind(this.view))
    $('.container').on('click', this.view.commentLinkSelector, this.view.showCommentForm.bind(this.view))
  }
}