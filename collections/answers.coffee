@Answers = new Meteor.Collection 'answers'

Meteor.methods
  answer: (answerAttributes) ->
    user = Meteor.user()
    question = Questions.findOne(answerAttributes.questionId)

    if !user
      throw new Meteor.Error 401, 'You need to login to answer'
    if !answerAttributes.body
      throw new Meteor.Error 422, 'Please write some content'
    if !question
      throw new Meteor.Error 422, 'You need to answer a question'

    answer = _.extend(_.pick(answerAttributes, 'questionId', 'body'),
      userId: user._id
      author: user.emails[0]['address']
      submitted: Date.now()
    )

    Questions.update answer.questionId,
      $inc:
        answersCount: 1

    return Answers.insert answer
