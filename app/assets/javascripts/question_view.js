function QuestionsView(){
  this.questionFormSelector = '.new-question-form'
  this.questionsListSelector = '.questions-list'
  this.answerFormSelector = '.new_answer'
  this.answersListSelector = '.answers-list'
}

QuestionsView.prototype = {
  appendQuestion: function(event, data, status){
    // console.log(arguments)
    $(this.questionsListSelector).append(data)
  },

  appendAnswer: function(event, data, status){
    console.log(data)
    $(this.answersListSelector).append(data)

  }
}