Template.header.helpers({
  activeRouteClass: function(/* route names */) {
    var args = Array.prototype.slice.call(arguments, 0);
    args.pop();

    var active = _.any(args, function(name) {
      return Router.current().route.name === name
    });

    return active && 'active';
  }
});

Template.header.events({
    'click #add-contact': function() {
        bootbox.prompt("Enter the email of your contact", function(contact) {
            if (contact !== null) {
                Meteor.call('addContact', contact, function(error, id) {
                    if (error) {
                        return alert(error);
                    }

                    Router.go('questionsList');
                })
            }
        });
    }
});
