Template.header.helpers
  activeRouteClass: (args...) ->
    args = args.slice 0
    args.pop()
    active = _.any args, (name) ->
      return Router.current().route.name == name

    return active && 'active'

Template.header.events
  'click #add-contact': ->
    bootbox.prompt "Enter the email of your contact", (contact) ->
      if contact != null
        Meteor.call 'addContact', contact, (error, id) ->
          if error
            return alert error
          Meteor.call 'sendInvitationEmail', contact
          Router.go 'questionsList'
