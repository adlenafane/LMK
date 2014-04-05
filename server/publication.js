Meteor.publish('questions', function() {
    return Questions.find();
});

Meteor.publish('answers', function(questionId) {
    return Answers.find({questionId: questionId});
});
