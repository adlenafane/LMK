Meteor.publish('questions', function() {
    return Questions.find({$or: [ {authorId: this.userId}, {recipientId: this.userId}]});
});

Meteor.publish('answers', function(questionId) {
    return Answers.find({questionId: questionId});
});
