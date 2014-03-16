Template.questionsAskedList.helpers({
    questions: function() {
        return Questions.find({authorId: '' + Meteor.userId()}, {askedDate: -1});
    }
});
