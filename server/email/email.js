process.env.MAIL_URL = "smtp://08d82c12c85217ac91e697f46f33be3a:60c442bcc3f69c6d25bd8bd9a6836ff6@in.mailjet.com:587/";

Meteor.methods({
    sendInvitationEmail: function(to) {
        this.unblock();

        var from = "adlenafane@gmail.com",
            sender = Meteor.user().emails[0]['address'],
            subject = sender + ' wants you to use LMK!',
            text = 'Hello, ' + sender + ' would like to invite you to Let Me Know! Please join ' + sender + ' at http://lmk.meteor.com';

        Email.send({
            to: to,
            from: from,
            subject: subject,
            text: text
        });
    }
});
