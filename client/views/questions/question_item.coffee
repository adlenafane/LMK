Template.questionItem.helpers
    ownQuestion: ->
        return this.userId == Meteor.userId()
