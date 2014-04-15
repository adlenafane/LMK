Template.questionsAskedList.helpers
  questions: ->
    return Questions.find
      authorId: '' + Meteor.userId()
    ,
      askedDate: -1
