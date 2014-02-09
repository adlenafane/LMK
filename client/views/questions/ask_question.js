Template.askQuestion.events({
    'submit form': function (e) {
        e.preventDefault();

        var question = {
            recipient: $(e.target).find('[name=recipient]').val(),
            question: $(e.target).find('[name=question]').val(),
        };

        question._id = Questions.insert(question);
        Router.go('questionsList');
    }
});