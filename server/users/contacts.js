Meteor.methods({
    getContactsEmail: function() {
        var contactsId = Meteor.user().validatedContacts || [];

        return contactsId.map(function(contactId) {
            var user = Meteor.users.findOne({ _id: contactId});
            return user !== null ? user.emails[0].address : '';
        });
    }
});