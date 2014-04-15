Meteor.publish "questions", ->
  return Questions.find $or: [
    {
      authorId: @userId
    }
    {
      recipientId: @userId
    }
  ]

Meteor.publish "answers", (questionId) ->
  return Answers.find
    questionId: questionId