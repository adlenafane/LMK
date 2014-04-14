Template.askQuestion.events
  'submit form': (e) ->
    e.preventDefault()
    question =
      recipient: $(e.target).find("[name=recipient]").val()
      question: $(e.target).find("[name=question]").val()

    Meteor.call 'question', question, (error, id) ->
      if error
        return alert error
    Router.go 'questionsList'

Template.askQuestion.created = ->
  Meteor.call 'getContactsEmail', (error, contacts) ->
    if error
      return null
    $("#recipient").typeahead source: contacts
