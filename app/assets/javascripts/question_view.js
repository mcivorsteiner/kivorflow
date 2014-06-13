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
  appendQuestion: function(event, data, status){
    console.log(event.target)
    $(this.questionsListSelector).append(data)
  },

  appendAnswer: function(event, data, status){
    $(this.answersListSelector).append(data)
  },

  appendComment: function(event, data, status){
    var commentableData = $(event.target).data("commentable")
    $element = this._getCommentList(commentableData)
    this._getCommentList(commentableData).append(data)
  },

  updateVoteTotal: function(event, data, status){
    var $element = this._getVoteTotalElement(data.votable_type, data.votable_id)
    $element.text(data.vote_total)
  },

  toggleCommentForm: function(){
    event.preventDefault()
    $(event.target).next().toggleClass("hidden")
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