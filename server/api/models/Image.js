/**
* Image.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/
module.exports = {
	tableName:'Image',
	autoCreatedAt:false,
	autoUpdatedAt:false,
	attributes: {
		ID:{
			type:'integer',
			columnName:'ID',
			autoIncrement:true,
			primaryKey:true
		},
		
		UID:{
			type:'string',
			columnName:'UID'
		},

		UserAccountID:{
			type:'integer',
			columnName:'UserAccountID'
		},

		FileName:{
			type:'string',
			columnName:'FileName'
		},

		FileLocation:{
			type:'string',
			columnName:'FileLocation',
		},

		Description:{
			type:'string',
			columnName:'Description'
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
		},
	},

	beforeCreate: function(image, cb) {
		image.CreatedDate = new Date();
		cb();
    },

    beforeUpdate:function(image,cb)
    {
    	image.ModifiedDate=new Date();
    	cb();
    }
};

