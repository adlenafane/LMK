Accounts.onCreateUser (options, user) ->
  user.validatedContacts = Meteor.call 'removeInvitations', user
  return user
