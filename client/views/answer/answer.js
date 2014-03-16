Template.answer.helpers({
    submittedText: function() {
        return moment(this.submitted).format('lll');
    }
});