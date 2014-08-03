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

  @route 'circles',
    path: '/circles'
    template: 'circles'

  @route 'circle',
    path: '/circle/:_id'
    data: -> return Circles.findOne @params._id
    template: 'circle'

requireLogin = (pause) ->
  if not Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render 'accessDenied'
    pause()

Router.onBeforeAction 'loading'
Router.onBeforeAction requireLogin,
  only: ['createCircle', 'circle']
