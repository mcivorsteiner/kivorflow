function SessionView(){
  this.loginFormSelector = '#login-form'
  this.signUpLinkSelector = '#sign-up-link'
  this.signUpDivSelector = '#sign-up-div'

}

SessionView.prototype = {
  showSignUpForm: function(){
    event.preventDefault()
    // $(this.loginFormSelector).toggleClass("hidden")
    $(this.signUpDivSelector).toggleClass("hidden")
  }
}