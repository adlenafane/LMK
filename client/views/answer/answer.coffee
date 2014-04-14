Template.answer.helpers
  submittedText: ->
    return moment(this.submitted).format 'lll'
