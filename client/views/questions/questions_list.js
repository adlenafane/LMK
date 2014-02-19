Template.questionsList.helpers({
    questions: function() {
        return Questions.find({}, {askedDate: -1});
    }
});