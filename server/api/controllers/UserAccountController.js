var o=require("../services/HelperService");
module.exports={
	_config: {
		actions: false,
		shortcuts: false,
		rest: false
	},

	CreateUserAccount:function(req,res)
	{
		var userInfo=req.body;

		UserAccountService.CreateUserAccount(userInfo)
		.then(function(user){
			res.ok(user);
		},function(err){
			res.serverError(ErrorWrap(err));
		});
	},

	GetListUsers:function(req,res)
	{
		var criteria=req.query;
		UserAccountService.GetListUsers(criteria)
		.then(function(user){
			res.ok(user);
		},function(err){
			res.serverError(ErrorWrap(err));
		})
	},

	GetUserDetails:function(req,res)
	{
		var criteria=req.query;
		console.log(criteria);
		UserAccountService.GetUserDetails(criteria)
		.then(function(user){
			if(o.checkData(user))
			{
				res.ok(user);
			}
			else
			{
				var error=new Error('GetUserDetails.Error');
				error.pushError('userAccount.notFound');
				res.notFound(ErrorWrap(error));
			}
		},function(err){
			res.serverError(ErrorWrap(err));
		})
	},

	GetUserDetailsWithImages:function(req,res)
	{
		var criteria=req.query;
		console.log(criteria);
		UserAccountService.GetUserDetailsWithImages(criteria)
		.then(function(user){
			if(o.checkData(user))
			{
				res.ok(user);
			}
			else
			{
				var error=new Error('GetUserDetailsWithImages.Error');
				error.pushError('userAccount.notFound');
				res.notFound(ErrorWrap(error));
			}
		},function(err){
			res.serverError(ErrorWrap(err));
		})
	},
}