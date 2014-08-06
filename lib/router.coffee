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
    action: -> Router.go 'circleActivities', {_id: @.params._id}

  @route 'circleActivities',
    path: '/circle/:_id/activities'
    data: -> return Circles.findOne @params._id
    template: 'circle'

  @route 'circleMembers',
    path: '/circle/:_id/members'
    data: -> return Circles.findOne @params._id
    template: 'circle'

  @route 'circleSettings',
    path: '/circle/:_id/settings'
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
