@Circles = new Meteor.Collection 'circles'

Meteor.methods
  circle: (circleAttributes) ->
    user = Meteor.user()

    # ensure the user is logged in
    if (!user)
      throw new Meteor.Error(401, "You need to login to create circle")

    # ensure the circle has a title
    if not circleAttributes.name
      throw new Meteor.Error(422, 'Please fill in a name');

    # pick out the whitelisted keys
    circle = _.extend _.pick(circleAttributes, 'name'),
      ownerId: user._id
      owner: user.username
      member: [user._id]
      created: new Date().getTime()

    Circles.insert circle
