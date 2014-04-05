Questions = new Meteor.Collection('questions');

Meteor.methods({
    question: function(questionAttributes) {
        var user = Meteor.user();

        Meteor.call(
            'getContactId',
            questionAttributes.recipient,
            function(error, recipientId) {
                console.log('recipientId: ' + recipientId);
                if (!user) {
                    throw new Meteor.Error(401, 'You need to login to ask questions');
                }

                if (!questionAttributes.recipient) {
                    throw new Meteor.Error(422, 'Please fill in a recipient');
                }

                if (!questionAttributes.question) {
                    throw new Meteor.Error(422, 'Please fill in a question');
                }

                if (!recipientId) {
                    throw new Meteor.Error(422, 'Contact not validated');
                }

                var question = _.extend(_.pick(questionAttributes, 'recipient', 'question'), {
                    authorId: user._id,
                    author: user.emails[0]['address'],
                    recipientId: recipientId,
                    submitted: new Date().getTime(),
                    answersCount: 0
                });

                return Questions.insert(question);
            });
    }
});
