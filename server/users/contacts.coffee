Meteor.methods
  getContactsEmail: ->
    contactsId = Meteor.user().validatedContacts or []

    return contactsId.map (contactId) ->
      user = Meteor.users.findOne _id: contactId
      return (if user? then user.emails[0].address else '')

  getAllContacts: ->
    contacts = []
    validatedContactsId = Meteor.call 'getValidatedContactsId'
    validatedContactsId.map (contactId) ->
      user = Meteor.users.findOne _id: contactId
      if user?
        contacts.push {'email': user.emails[0].address, 'invited': false, 'validated': true}

    invitedContactsEmail = Meteor.user().invitedContacts or []

    invitedContactsEmail.map (contact) ->
      contactId = Meteor.call 'getContactId', contact
      if not contactId
        contacts.push {'email': contact, 'invited': true, 'validated': false}

    return contacts

  getValidatedContactsId: ->
    return Meteor.user().validatedContacts or []

  getContactId: (contactEmail) ->
    contactsId = Meteor.user().validatedContacts or []
    contactFoundId = ""

    contactsId.forEach (contactId) ->
      contactFound = Meteor.users.findOne( _id: contactId )
      if contactFound
        contactFoundEmail = contactFound.emails[0].address or ''
      else
        contactFoundEmail = ''
      if contactEmail == contactFoundEmail
        contactFoundId = contactId
      return
    return contactFoundId
