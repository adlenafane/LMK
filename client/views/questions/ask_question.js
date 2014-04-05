Template.askQuestion.events({
    'submit form': function (e) {
        e.preventDefault();

        var question = {
            recipient: $(e.target).find('[name=recipient]').val(),
            question: $(e.target).find('[name=question]').val()
        };

        Meteor.call('question', question, function(error, id) {
            if (error) {
                return alert(error);
            }

            Router.go('questionsList');
        });
    }
});

Template.askQuestion.created = function() {
    Meteor.call('getContactsEmail', function(error, contacts) {
        if (error) {
            return null;
        }
        $("#recipient").typeahead({ source: contacts });
    });
};
