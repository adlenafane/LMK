Template.createCircle.events
  "submit form": (e) ->
    e.preventDefault()
    circle =
      name: $(e.target).find("[name=circle-name]").val()

    Meteor.call 'circle', circle, (error, id) ->
      if error then return alert(error.reason)
      Router.go "circle",
        _id: id

    return
