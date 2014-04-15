Template.questionsList.helpers
  questions: ->
    return Questions.find {},
      sort:
        submitted: -1
