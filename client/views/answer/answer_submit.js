Template.answerSubmit.events({
    'submit form': function(e, template) {
        e.preventDefault();

        var $body = $(e.target).find('[name=body]'),
            answer = {
                body: $body.val(),
                questionId: template.data._id
            };

        Meteor.call('answer', answer, function(error, answerId) {
            if (error) {
                throwError(error.reason);
            } else {
                $body.val('');
            }
        });
    }
});