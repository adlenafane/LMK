Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: ->
    return
    [
      Meteor.subscribe('questions')
      Meteor.subscribe('answers')
    ]

Router.map ->
  @route 'questionsList',
    path: '/'
    template: 'questionsList'
    findOptions: ->
      sort:
        submitted: -1
    waitOn: ->
      Meteor.subscribe 'questions'
    questions: ->
      Questions.find {}, @findOptions()

  @route 'questionPage',
    path: '/questions/:_id'
    waitOn:
      Meteor.subscribe 'answers', @params._id
    data: ->
      Questions.findOne @params._id

  @route 'askQuestion',
    path: '/askQuestion'

  @route 'askedQuestions',
    path: '/askedQuestions'
    template: 'questionsAskedList'

requireLogin = ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      this.render 'accessDenied'
    this.pause()

Router.onBeforeAction 'loading'
Router.onBeforeAction requireLogin,
  only:
    [
      'askQuestion',
      'askedQuestions',
      'questionPage'
    ]