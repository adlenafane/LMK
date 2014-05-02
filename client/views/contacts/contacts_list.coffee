Template.contactsList.helpers
  contacts: ->
    Meteor.call 'getAllContacts', (error, contacts) ->
      if error
        return null
      Session.set 'contacts', contacts

    return Session.get 'contacts'