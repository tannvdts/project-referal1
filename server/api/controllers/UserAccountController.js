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
	}
}