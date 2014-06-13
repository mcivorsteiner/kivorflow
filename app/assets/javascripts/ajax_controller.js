function AjaxController(questionView){
  this.questionView = questionView
}

AjaxController.prototype = {
  init: function(){
    $(this.questionView.questionFormSelector).on('ajax:success', this.questionView.appendQuestion.bind(this.questionView))
    $(this.questionView.answerFormSelector).on('ajax:success', this.questionView.appendAnswer.bind(this.questionView))
    $('.container').on('ajax:success', this.questionView.commentFormSelector, this.questionView.appendComment.bind(this.questionView))
    $('.container').on('ajax:success', this.questionView.voteFormSelector, this.questionView.updateVoteTotal.bind(this.questionView))
    $('.container').on('click', this.questionView.commentLinkSelector, this.questionView.toggleCommentForm.bind(this.questionView))
  }
}