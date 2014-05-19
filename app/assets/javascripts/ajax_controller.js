function AjaxController(questionView){
  this.questionView = questionView
}

AjaxController.prototype = {
  init: function(){
    $(this.questionView.questionFormSelector).on('ajax:success', this.questionView.appendQuestion.bind(this.questionView))
    $(this.questionView.answerFormSelector).on('ajax:success', this.questionView.appendAnswer.bind(this.questionView))

  }
}