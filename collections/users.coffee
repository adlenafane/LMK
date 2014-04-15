Meteor.methods
  addContact: (newContact) ->
    user = Meteor.user()
    invitedContacts = user.invitedContacts or []
    alreadyInvited = undefined

    alreadyInvited = invitedContacts.reduce( (alreadyInvited, contact) ->
      return alreadyInvited or(contact == newContact)
    , false)

    unless alreadyInvited
      Meteor.users.update
        _id: user._id
      ,
        $push:
          invitedContacts: newContact
      Meteor.call('addInvitation', user, newContact)

    return
