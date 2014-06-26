function SessionController(sessionView){
  this.view = sessionView
}

SessionController.prototype = {
  init: function(){
    $(this.view.signUpLinkSelector).on('click', this.view.showSignUpForm.bind(this.view))
  }
}