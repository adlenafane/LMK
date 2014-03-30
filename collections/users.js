Meteor.methods({
    addContact: function(contact) {
        var user = Meteor.user();

        Meteor.users.update(
            { _id: user._id },
            { $push: { contacts: {email: contact, validated: false} } }
        )
    }
});
