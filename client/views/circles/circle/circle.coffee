#Template.circle.rendered ->
#  Meteor.call 'getMemberDetails', @data , (error, memberDetails) ->
#    if error then alert(error.reason)
#    console.log memberDetails
#    @data.memberDetails = memberDetails
#  return

Template.circle.helpers
  activeIfRouteIs: (route) ->
    currentRoute = Router.current()
    if currentRoute && route == currentRoute.route.name then 'active' else ''
