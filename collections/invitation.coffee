Invitations = new Meteor.Collection 'invitations'

Meteor.methods
  addInvitation: (author, recipientEmail) ->
    invitation =
      authorId: author._id
      recipient: recipientEmail

    return Invitations.update invitation, invitation,
      upsert: true

  removeInvitations: (newUser) ->
    newUserEmail = newUser.emails[0]['address']
    invitations = Invitations.find recipient: newUserEmail
    validatedContacts = []

    invitations.forEach (invitation) ->
      # Add the new users to people who invited him
      Meteor.users.update
          _id: invitation.authorId
      ,
          $push:
            validatedContacts: newUser._id

      # Add people who invited him to its contact
      validatedContacts.push invitation.authorId
    Invitations.remove recipient: newUserEmail

    return validatedContacts
