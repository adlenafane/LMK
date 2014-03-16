/**
    Publish only the elements related to the current user

    {
        $or:
        [
            { authorId: '' + this.userId() },
            { recipientId: '' + this.userId() }
        ]
    }
*/
Meteor.publish('questions', function() {
    return Questions.find();
});

Meteor.publish('answers', function(questionId) {
    return Answers.find({questionId: questionId});
});