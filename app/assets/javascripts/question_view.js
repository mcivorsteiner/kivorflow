function QuestionsView(){
  this.questionFormSelector = '.new-question-form'
  this.questionsListSelector = '.questions-list'
  this.answerFormSelector = '.new_answer'
  this.answersListSelector = '.answers-list'
  this.commentFormSelector = '.new-comment'
  this.voteFormSelector = '.vote-form'
  this.commentLinkSelector = ".comment-form-link"
  this.commentDivSelector = ".comment-form"
}

QuestionsView.prototype = {
  appendQuestion: function(e, data){
    console.log(e.target)
    $(this.questionsListSelector).append(data)
  },

  appendAnswer: function(e, data){
    $(this.answersListSelector).append(data)
  },

  appendComment: function(e, data){
    var commentableData = $(e.target).data("commentable")
    $element = this._getCommentList(commentableData)
    this._getCommentList(commentableData).append(data)
  },

  updateVoteTotal: function(e, data){
    var $element = this._getVoteTotalElement(data.votable_type, data.votable_id)
    $element.text(data.vote_total)
  },

  toggleElement: function(element){
    $(element).toggleClass("hidden")
  },

  resetForm: function(form){
    form.reset()
  },

  renderVoteError: function(e, data){
    alert(data.responseJSON.error)
    // debugger
    // var errorMessage = data.responseText
  },

  _getCommentList: function(commentableData){
    var selector = ".comment-list[data-commentable='" + commentableData + "'] ul"
    return $(selector)
  },

  _getVoteTotalElement: function(votable_type, votable_id){
    var selector = ".vote_total[data-votable='" + votable_type + votable_id + "']"
    return $(selector)
  }


}