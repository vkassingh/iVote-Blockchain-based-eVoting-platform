const path = require('path');
var nodemailer = require('nodemailer');

module.exports = {
	register: function (req, res, cb) {
		var transporter = nodemailer.createTransport({
			service: 'gmail',
			auth: {
				user: process.env.EMAIL,
				pass: process.env.PASSWORD,
			},
		});
		const mailOptions = {
			from: process.env.EMAIL,
			to: req.body.email,
			subject: req.body.election_name + 'Registration',
			html: 'You are invited to vote for  ' + req.body.election_name + ' election on 24-08-2022',
		};
		transporter.sendMail(mailOptions, function (err, info) {
			if (err) {
				res.json({ status: 'error', message: 'mail error', data: null });
				console.log(err);
			} else console.log(info);
			res.json({ status: 'success', message: 'mail sent successfully!!!', data: null });
		});
	},
};