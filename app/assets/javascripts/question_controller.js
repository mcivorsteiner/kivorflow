function QuestionController(questionView){
  this.view = questionView
}

QuestionController.prototype = {
  init: function(){
    $(this.view.questionFormSelector).on('ajax:success', this.appendQuestion.bind(this))
    $(this.view.answerFormSelector).on('ajax:success', this.appendAnswer.bind(this))
    $('.container').on('ajax:success', this.view.commentFormSelector, this.appendComment.bind(this))
    $('.container').on('ajax:success', this.view.voteFormSelector, this.view.updateVoteTotal.bind(this.view))
    $('.container').on('ajax:error', this.view.voteFormSelector, this.view.renderVoteError.bind(this.view))
    $('.container').on('click', this.view.commentLinkSelector, this.toggleCommentForm.bind(this))
  },

  appendQuestion: function(e, data){
    this.view.appendQuestion(e, data)
    this.view.resetForm(e.target)
  },

  appendAnswer: function(e, data){
    this.view.appendAnswer(e, data)
    this.view.resetForm(e.target)
  },

  appendComment: function(e, data){
    this.view.appendComment(e, data)
    this.view.resetForm(e.target)
    this.view.toggleElement($(e.target).parent())
  },

  toggleCommentForm: function(e){
    e.preventDefault()
    var commentFormDiv = $(e.target).next()
    this.view.toggleElement(commentFormDiv)
    commentFormDiv.find("input[type='text']")[0].focus()
  }
}