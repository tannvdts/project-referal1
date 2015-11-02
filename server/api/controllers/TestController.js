var path=require("path");
module.exports={
	_config: {
		actions: false,
		shortcuts: false,
		rest: false
	},

	TestGet:function(req,res)
	{		
		console.log(sails.config.appPath);
		console.log(require('path').resolve(sails.config.appPath, '/assets/images'))
		res.ok({status:'success'});
	}
}