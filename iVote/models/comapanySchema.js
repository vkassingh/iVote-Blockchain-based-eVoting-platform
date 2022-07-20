var mongoose = require('mongoose');
var Schema = mongoose.Schema;

companySchema = new Schema( {
	
	unique_id: Number,
	email: String,
	username: String,
	password: String,
	passwordConf: String
}),
Company = mongoose.model('User', companySchema);

module.exports = Company;