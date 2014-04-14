Template.questionPage.helpers
    answers: ->
        return Answers.find questionId: this._id
