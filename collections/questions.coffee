@Questions = new Meteor.Collection 'questions'

Meteor.methods
  question: (questionAttributes) ->
    user = Meteor.user()
    Meteor.call('getContactId', questionAttributes.recipient, (error, recipientId) ->
      throw new Meteor.Error 401, 'You need to login to ask questions' unless user
      throw new Meteor.Error 422, 'Please fill in a recipient' unless questionAttributes.recipient
      throw new Meteor.Error 422, 'Please fill in a question' unless questionAttributes.question
      throw new Meteor.Error 422, 'Contact not validated' unless recipientId

      question = _.extend(_.pick(questionAttributes, "recipient", "question"),
        authorId: user._id
        author: user.emails[0]["address"]
        recipientId: recipientId
        submitted: new Date().getTime()
        answersCount: 0
      )

      return Questions.insert question
    )
