function AjaxController(questionView){
  this.questionView = questionView
}

AjaxController.prototype = {
  init: function(){
    $(this.questionView.questionFormSelector).on('ajax:success', this.appendQuestion.bind(this))
    $(this.questionView.answerFormSelector).on('ajax:success', this.appendAnswer.bind(this))
    $('.container').on('ajax:success', this.questionView.commentFormSelector, this.appendComment.bind(this))
    $('.container').on('ajax:success', this.questionView.voteFormSelector, this.questionView.updateVoteTotal.bind(this.questionView))
    $('.container').on('click', this.questionView.commentLinkSelector, this.toggleCommentForm.bind(this))
  },

  appendQuestion: function(e, data){
    this.questionView.appendQuestion(e, data)
    this.questionView.resetForm(e.target)
  },

  appendAnswer: function(e, data){
    this.questionView.appendAnswer(e, data)
    this.questionView.resetForm(e.target)
  },

  appendComment: function(e, data){
    this.questionView.appendComment(e, data)
    this.questionView.resetForm(e.target)
    this.questionView.toggleElement($(e.target).parent())
  },

  toggleCommentForm: function(e){
    e.preventDefault()
    var commentFormDiv = $(e.target).next()
    this.questionView.toggleElement(commentFormDiv)
  }
}