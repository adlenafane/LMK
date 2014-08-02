Router.configure
  layoutTemplate: 'layout'
  yieldTemplates:
    header:
      to: 'header'

Router.map ->
  @route 'home',
    path: '/'
    template: 'home'

  @route 'createCircle',
    path: '/create-circle'
    template: 'createCircle'

requireLogin = (pause) ->
  if not Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render 'accessDenied'
    pause()

Router.onBeforeAction 'loading'
Router.onBeforeAction requireLogin,
  only: 'activity'
