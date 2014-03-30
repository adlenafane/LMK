Template.questionsList.helpers({
    questions: function() {
        return Questions.find(
            {
                $or: [
                { authorId: '' + Meteor.userId() },
                { recipientId: '' + Meteor.userId() }]
            },
            { askedDate: -1 }
        );
    }
});
