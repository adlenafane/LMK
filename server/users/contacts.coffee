Meteor.methods
  getContactsEmail: ->
    contactsId = Meteor.user().validatedContacts or []

    return contactsId.map (contactId) ->
      user = Meteor.users.findOne _id: contactId
      return (if user? then user.emails[0].address else '')

  getContactId: (contactEmail) ->
    contactsId = Meteor.user().validatedContacts or []
    contactFoundId = ""

    contactsId.forEach (contactId) ->
      contactFoundEmail = Meteor.users.findOne( _id: contactId ).emails[0].address;
      if contactEmail == contactFoundEmail
        contactFoundId = contactId
      return
    return contactFoundId
