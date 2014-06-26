function SessionController(sessionView){
  this.view = sessionView
}

SessionController.prototype = {
  init: function(){
    $(this.view.signUpLinkSelector).on('click', this.view.toggleSignUpForm.bind(this.view))
  }
}