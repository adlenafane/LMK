Meteor.publish 'circles', (ownerId) ->
  Circles.find({ ownerId: ownerId })


