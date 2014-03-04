Router.configure({
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  waitOn: function() { return Meteor.subscribe('questions'); }
});

Router.map(function() {
  this.route('questionsList', {path: '/'});

  this.route('questionPage', {
    path: '/questions/:_id',
    data: function() { return Questions.findOne(this.params._id); }
  });

  this.route('askQuestion', {
    path: '/ask'
  });

  this.route('askedQuestions', {
    path: '/askedQuestions'
  });
});

var requireLogin = function() {
  if (! Meteor.user()) {
    if (Meteor.loggingIn()) {
      this.render(this.loadingTemplate);
    } else {
      this.render('accessDenied');
    }

    this.stop();
  }
}

Router.before(requireLogin, { only: ['askQuestion', 'askedQuestions'] });
