Meteor.methods({
    addContact: function(newContact) {
        var user = Meteor.user(),
            invitedContacts = user.invitedContacts || [],
            alreadyInvited;

        alreadyInvited = invitedContacts.reduce(function(alreadyInvited, contact) {
            return alreadyInvited || (contact === newContact);
        }, false);

        if (!alreadyInvited) {
            Meteor.users.update(
                { _id: user._id },
                { $push: { invitedContacts: newContact } }
            );

            Meteor.call('addInvitation', user, newContact);
        }
    }
});
