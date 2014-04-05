Router.configure({
    layoutTemplate: 'layout',
    loadingTemplate: 'loading',
    waitOn: function() {
        return [
            Meteor.subscribe('questions'),
            Meteor.subscribe('answers')
        ];
    }
});

Router.map(function() {
    this.route('questionsList', {path: '/'});

    this.route('questionPage', {
        path: '/questions/:_id',
        waitOn: function() {
            return Meteor.subscribe('answers', this.params._id);
        },
        data: function() { return Questions.findOne(this.params._id); }
    });

    this.route('askQuestion', {
        path: '/askQuestion'
    });

    this.route('askedQuestions', {
        path: '/askedQuestions',
        template: 'questionsAskedList'
    });
});

var requireLogin = function() {
    if (! Meteor.user()) {
        if (Meteor.loggingIn()) {
            this.render(this.loadingTemplate);
        } else {
            this.render('accessDenied');
        }
        this.pause();
    }
};

Router.onBeforeAction('loading');
Router.onBeforeAction(requireLogin, { only: ['askQuestion', 'askedQuestions', 'questionPage'] });
