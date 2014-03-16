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
        // return Questions.find({}, {askedDate: -1});
    }
});