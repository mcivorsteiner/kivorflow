function QuestionsView(){
  this.questionFormSelector = '.new-question-form'
  this.questionsListSelector = '.questions-list'
  this.answerFormSelector = '.new_answer'
  this.answersListSelector = '.answers-list'
  this.commentFormSelector = '.new-comment'
}

QuestionsView.prototype = {
  appendQuestion: function(event, data, status){
    console.log(event.target)
    $(this.questionsListSelector).append(data)
  },

  appendAnswer: function(event, data, status){
    console.log(event.target)

    $(this.answersListSelector).append(data)
  },

  appendComment: function(event, data, status){
    var commentableData = $(event.target).data("commentable")
    $element = this._getCommentList(commentableData)
    this._getCommentList(commentableData).append(data)
  },

  _getCommentList: function(commentableData){
    var selector = ".comment-list[data-commentable='" + commentableData + "'] ul"
    return $(selector)
  }
}