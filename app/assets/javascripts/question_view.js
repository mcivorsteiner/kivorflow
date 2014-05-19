function QuestionsView(){
  this.questionFormSelector = '.new-question-form'
  this.questionListSelector = '.questions-list'
}

QuestionsView.prototype = {
  appendQuestion: function(event, data, status){
    // console.log(arguments)
    $(this.questionListSelector).append(data)
  }
}