@Circles = new Meteor.Collection 'circles'

Meteor.methods
  circle: (circleAttributes) ->
    user = Meteor.user()

    # ensure the user is logged in
    if (!user) then throw new Meteor.Error(401, "You need to login to create circle")

    # ensure the circle has a title
    if not circleAttributes.name then throw new Meteor.Error(422, 'Please fill in a name')

    # pick out the whitelisted keys
    circle = _.extend _.pick(circleAttributes, 'name'),
      ownerId: user._id
      owner: user.username
      members: [user._id]
      created: new Date().getTime()

    Circles.insert circle

  getMemberDetails: (circleId) ->
    console.log "--------------------------------------------------------------"
    console.log "circleId"
    console.log circleId
    circle = Circles.findOne({_id: circleId})
    console.log "--------------------------------------------------------------"
    console.log "circle"
    console.log circle
    circle?.members?.map (memberId) ->
      Meteor.users.find({_id: memberId})

    return circle.members
