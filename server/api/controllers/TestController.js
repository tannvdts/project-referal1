module.exports={
	_config: {
		actions: false,
		shortcuts: false,
		rest: false
	},

	TestGet:function(req,res)
	{
		res.ok({status:'success'});
	}
}