Template.circle.rendered ->
  Meteor.call 'getMemberDetails', @data , (error, memberDetails) ->
    if error then alert(error.reason)
    console.log memberDetails
    @data.memberDetails = memberDetails
  return
