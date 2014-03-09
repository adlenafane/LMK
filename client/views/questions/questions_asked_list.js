Template.questionsAskedList.helpers({
    questions: function() {
        return Questions.find({userId: '' + Meteor.userId()}, {askedDate: -1});
    }
});
