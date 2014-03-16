Questions = new Meteor.Collection('questions');

Meteor.methods({
    question: function(questionAttributes) {
        var user = Meteor.user();

        if (!user) {
            throw new Meteor.Error(401, 'You need to login to ask questions');
        }

        if (!questionAttributes.recipient) {
            throw new Meteor.Error(422, 'Please fill in a recipient');
        }

        if (!questionAttributes.question) {
            throw new Meteor.Error(422, 'Please fill in a question');
        }

        var question = _.extend(_.pick(questionAttributes, 'recipient', 'question'), {
            authorId: user._id,
            author: user.emails[0]['address'],
            askedDate: new Date().getTime()
        })

        var questionId = Questions.insert(question);

        return questionId;
    }
});
