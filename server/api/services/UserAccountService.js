var $q=require("q");
var o=require("./HelperService");
module.exports={
	CreateUserAccount:function(userInfo,transaction)
	{
		console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>")
		var error=new Error("CreateUserAccount.Error");
		function Validation()
		{
			var q=$q.defer();
			try
			{
				var objValidation={
					UID:null,
					UserName:null,
					Email:null,
					Password:null,
					UserType:null,
					FirstName:null,
					LastName:null,
					Gender:null,
					DOB:null,
					Address:null,
					PhoneNumber:null,
					Enable:null,
					CreatedBy:null,
					CreatedDate:null,
					ModifiedBy:null,
					ModifiedDate:null,
				}
				userInfo=o.rationalizeObject(userInfo,objValidation);
				if(!o.checkData(userInfo.UID))
				{
					userInfo.UID=o.createUid();
				}

				if(!o.checkData(userInfo.UserName))
				{
					error.pushError("UserName.notProvided");
				}

				if(!o.checkData(userInfo.Password))
				{
					error.pushError("Password.notProvided");
				}

				if(error.getErrors().length>0)
				{
					throw error;
				}
				else
				{
					q.resolve({status:'success'});
				}

			}
			catch(err)
			{
				q.reject(err);
			}
			return q.promise;
		}
		
		return Validation()
		.then(function(data){
			return UserAccount.create(userInfo)
			.then(function(user){
				return user;
			})
			.catch(function(err){
				error.pushError("UserAccount.createError");
				throw error;
			})

		},function(err){
			throw err;
		})

	}
}