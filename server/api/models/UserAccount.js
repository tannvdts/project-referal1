var bcrypt = require('bcrypt-nodejs');

module.exports={
	tableName:'UserAccount',
	autoCreatedAt:false,
	autoUpdatedAt:false,
	attributes:{
		ID:{
			type:'integer',
			columnName:'ID'
		},

		UID:{
			type:'string',
			columnName:'UID'
		},

		UserName:{
			type:'string',
			columnName:'UserName'
		},

		Email:{
			type:'string',
			columnName:'Email'
		},

		Password:{
			type:'string',
			columnName:'Password'
		},

		UserType:{
			type:'string',
			columnName:'UserType'
		},

		FirstName:{
			type:'string',
			columnName:'FirstName'
		},

		LastName:{
			type:'string',
			columnName:'LastName'
		},

		Gender:{
			type:'string',
			columnName:'Gender'
		},

		DOB:{
			type:'date',
			columnName:'DOB'
		},

		Address:{
			type:'string',
			columnName:'Address'
		},

		PhoneNumber:{
			type:'string',
			columnName:'PhoneNumber'
		},

		Enable:{
			type:'string',
			columnName:'Enable'
		},

		CreatedBy:{
			type:'integer',
			columnName:'CreatedBy'
		},

		CreatedDate:{
			type:'datetime',
			columnName:'CreatedDate'
		},

		ModifiedBy:{
			type:'integer',
			columnName:'ModifiedBy'
		},

		ModifiedDate:{
			type:'datetime',
			columnName:'ModifiedDate'
		}
	},

	beforeCreate: function(user, cb) {
        bcrypt.genSalt(10, function(err, salt) {
            bcrypt.hash(user.Password, salt, function(err, hash) {
                if (err) {
                    console.log(err);
                    cb(err);
                } else {
                    user.Password = hash;
                    cb();
                }
            });
        });
    }
}