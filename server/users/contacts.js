Meteor.methods({
    getContactsEmail: function() {
        var contactsId = Meteor.user().validatedContacts || [];

        return contactsId.map(function(contactId) {
            var user = Meteor.users.findOne({ _id: contactId});
            return user !== null ? user.emails[0].address : '';
        });
    },

    getContactId: function(contactEmail) {
        var contactsId = Meteor.user().validatedContacts || [],
            contactFoundId = [];

        contactsId.forEach(function(contactId) {
            var contactFoundEmail = Meteor.users.findOne({ _id: contactId}).emails[0].address;
            if (contactEmail === contactFoundEmail) {
                contactFoundId = contactId;
            }
        });
        console.log("contactFoundId: " + contactFoundId);
        return contactFoundId;
    }
});
