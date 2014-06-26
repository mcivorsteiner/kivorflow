function SessionView(){
  this.loginFormSelector = '#login-form'
  this.signUpLinkSelector = '#sign-up-link'
  this.signUpDivSelector = '#sign-up-div'

}

SessionView.prototype = {
  showSignUpForm: function(){
    event.preventDefault()
    $(this.signUpDivSelector).toggleClass("hidden")
  }
}