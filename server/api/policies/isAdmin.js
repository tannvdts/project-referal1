var o=require("../services/HelperService");
var ErrorWrap=require("../services/ErrorWrap");
module.exports=function(req,res,next){
	var error=new Error("Policies.isAdmin.Error");
	if(o.checkData(req.user))
	{
		if(user.UserType==o.const.userType.admin)
		{
			next();
		}
		else
		{
			error.pushError("isAdmin.notAdmin");
			return res.unauthor(ErrorWrap(error));
		}
	}
	else
	{
		error.pushError("isAdmin.notLogin");
		return res.unauthor(ErrorWrap(error));
	}
}