function AjaxController(questionView){
  this.questionView = questionView
}

AjaxController.prototype = {
  init: function(){
    $(this.questionView.questionFormSelector).on('ajax:success', this.questionView.appendQuestion.bind(this.questionView))
    $(this.questionView.answerFormSelector).on('ajax:success', this.questionView.appendAnswer.bind(this.questionView))
    $('.container').on('ajax:success', this.questionView.commentFormSelector, this.appendComment.bind(this))
    $('.container').on('ajax:success', this.questionView.voteFormSelector, this.questionView.updateVoteTotal.bind(this.questionView))
    $('.container').on('click', this.questionView.commentLinkSelector, this.toggleCommentForm.bind(this))
  },


  appendComment: function(e, data, status){
    this.questionView.appendComment(e, data)
    e.target.reset()
    var formDiv = $(e.target).parent()
    this.questionView.toggleCommentForm(formDiv)
  },

  toggleCommentForm: function(e){
    e.preventDefault()
    var commentForm = $(e.target).next()
    this.questionView.toggleCommentForm(commentForm)
  }
}