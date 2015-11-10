var o=require("../services/HelperService");
module.exports={
	_config: {
		actions: false,
		shortcuts: false,
		rest: false
	},

	/**
	 * CreateUserAccount: function mapping với api tạo user account
	 * Input: 
	 * 	-request.body: chứa các key và value tương ứng với field và giá trị của userAccount
	 * Output:
	 *  -Nếu thành công trả về http status 200+new user info
	 *  -Nếu thất bại trả về http status 500+thông tin lỗi
	 */
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

	/**
	 * GetListUsers: lấy danh sách user theo điều kiện
	 * Nếu điều kiện rỗng thì lấy toàn bộ users
	 * Input:
	 * 	- req.query: chứa các key và value tương ứng với field và giá trị để filter
	 * Output:
	 * - Nếu thành công trả về http status 200+list user
	 * - Nếu thất bại trả về http status 500+ thông tin error
	 */
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

	/**
	 * GetUserDetails: lấy thông tin của user
	 * Input: req.query: {ID hoặc UID của user}
	 * Output: 
	 * - Nếu thành công trả về http status 200+ thông tin user
	 * - Nếu thất bại trả về http status 500+ thông tin error
	 */
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

	/**
	 * GetUserDetails: lấy thông tin của user và images của user đó
	 * Input: req.query: {ID hoặc UID của user}
	 * Output: 
	 * - Nếu thành công trả về http status 200+ thông tin user và images
	 * - Nếu thất bại trả về http status 500+ thông tin error
	 */
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