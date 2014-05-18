function HomeView(){
  this.loginFormSelector = '#login-form'
  this.signUpLinkSelector = '#sign-up-link'
  this.signUpDivSelector = '#sign-up-div'
  this.commentLinkSelector = ".comment-form-link"
  this.commentDivSelector = ".comment-form"
}

HomeView.prototype = {
  showSignUpForm: function(){
    event.preventDefault()
    // $(this.loginFormSelector).toggleClass("hidden")
    $(this.signUpDivSelector).toggleClass("hidden")
  },

  showCommentForm: function(){
    console.log("hello")
    event.preventDefault()
    $(event.target).next().toggleClass("hidden")
  }
}