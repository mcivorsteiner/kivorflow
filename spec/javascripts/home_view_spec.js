describe("HomeView", function(){

  

  // afterEach(function(){
  //   document.body.removeChild(signUpFormDiv)
  // });

  describe("showSignUpForm", function(){
    var homeView = new HomeView

    var $signUpFormDiv = $(document.createElement('div')).attr({id: "sign-up-div", class: "hidden"})
    $(document.body).append($signUpFormDiv)
    console.log($signUpFormDiv)
    // it("showSignUpForm", function(){
    //   console.log($signUpFormDiv)
    //   console.log(document.body)

    //   homeView.showSignUpForm()
    //   expect($signUpFormDiv.attr("class")).not.toEqual("hidden")
    // })
  })
})