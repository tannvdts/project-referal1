var path=require("path");
module.exports={
	_config: {
		actions: false,
		shortcuts: false,
		rest: false
	},

	TestGet:function(req,res)
	{		
		// console.log(sails.config.appPath);
		// console.log(require('path').resolve(sails.config.appPath, '/assets/images'))
		// Image.find({ID:1})
		// // .populate('images')
		// // .populate('user')
		// .then(function(data){
		// 	res.ok(data,test);
		// },function(err){
		// 	res.serverError(err);
		// })
		res.ok({status:sails.config.myconfig});
	}
}