var $q=require("q");
var o=require("./HelperService");
var moment=require("moment");
module.exports={

	/**
	 * CreateUserAccount: tạo thông tin user
	 * Input: 
	 * 	- userInfo
	 * Output:
	 * 	- nếu tạo thành công trả về thông tin user vừa được tạo
	 * 	- nếu tạo thất bại thì throw về lỗi
	 */
	CreateUserAccount:function(userInfo)
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

				if(o.checkData(userInfo.Email) && !o.isValidEmail(userInfo.Email))
				{
					error.pushError("Email.invalid");
				}

				if(o.checkData(userInfo.UserType) && o.getUserTypes().indexOf(userInfo.UserType)<0)
				{
					error.pushError("UserType.invalid");
				}

				if(o.checkData(userInfo.Enable) && ['Y','N'].indexOf(userInfo.Enable)<0)
				{
					error.pushError("Enable.invalid");
				}

				if(o.checkData(userInfo.DOB))
				{
					if(moment(userInfo.DOB,'DD-MM-YYYY').isValid())
					{
						userInfo.DOB=moment(userInfo.DOB,"DD-MM-YYYY").toDate();
					}
					else
					{
						error.pushError("DOB.invalid");
					}
				}

				if(o.checkData(userInfo.PhoneNumber))
				{
					userInfo.PhoneNumber=o.parsePhoneNumber(userInfo.PhoneNumber);
					if(!o.checkData(userInfo.PhoneNumber))
					{
						error.pushError("PhoneNumber.invalid");
					}
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
				console.log(err);
				error.pushError("UserAccount.createError");
				throw error;
			})

		},function(err){
			throw err;
		})

	},

	/**
	 * GetListUsers: lấy danh sách user theo điều kiện, 
	 * nếu điều kiện trống thì trả về toàn bộ users
	 * input: 
	 * 	-criteria: là 1 json trong đó key là tên field và value là giá trị cần filter
	 * 		các field hổ trợ filter bao gồm:
	 * 			UserName,Email,FirstName,LastName,Gender,DOB,PhoneNumber,Address,UserType,Enable
	 * output:
	 * 	-nếu thành công trả về danh sách user
	 * 	-nếu thất bại throw về error
	 */
	GetListUsers:function(criteria)
	{
		var error=new Error("GetListUsers.Error");
		var whereClause={};
		function Validation()
		{
			var q=$q.defer();
			try
			{
				var objValidation={
					UserName:null,
					Email:null,
					FirstName:null,
					LastName:null,
					Gender:null,
					DOB:null,
					PhoneNumber:null,
					Address:null,
					UserType:null,
					Enable:null,
				}
				criteria=o.rationalizeObject(criteria,objValidation);

				if(o.checkData(criteria.UserName))
				{
					whereClause.UserName={'contains':criteria.UserName};
				}

				if(o.checkData(criteria.Email))
				{
					whereClause.Email={'contains':criteria.Email};
				}

				if(o.checkData(criteria.FirstName))
				{
					whereClause.FirstName={'contains':criteria.FirstName};
				}

				if(o.checkData(criteria.LastName))
				{
					whereClause.LastName={'contains':criteria.LastName};
				}

				if(o.checkData(criteria.Gender))
				{
					whereClause.Gender=criteria.Gender;
				}

				if(o.checkData(criteria.DOB))
				{
					var dobm=moment(criteria.DOB,'DD-MM-YYYY ZZ');
					var nextdobm=dobm.clone().add(1,'days');
					console.log(dobm.format("DD-MM-YYYY HH:mm:ss"));
					console.log(nextdobm.format("DD-MM-YYYY HH:mm:ss"));
					whereClause.DOB={
						'>=':dobm.toDate(),
						'<':nextdobm.toDate()
					}
				}

				if(o.checkData(criteria.PhoneNumber))
				{
					whereClause.PhoneNumber={'contains':criteria.PhoneNumber};
				}

				if(o.checkData(criteria.Address))
				{
					whereClause.Address={'contains':criteria.Address};
				}

				if(o.checkData(criteria.UserType))
				{
					whereClause.UserType=criteria.UserType;
				}

				if(o.checkData(criteria.Enable))
				{
					whereClause.Enable=criteria.Enable;
				}

				q.resolve({status:'success'});

			}
			catch(err)
			{
				q.reject(err);
			}
			return q.promise;
		}

		return Validation()
		.then(function(data){
			return UserAccount.find(whereClause)
			.then(function(users){
				return users;
			},function(err){
				error.pushError("UserAccount.queryError");
			})
		},function(err){
			throw err;
		})
	},

	/**
	 * GetUserDetails: lấy thông tin user thông qua ID hoặc UID của user đó
	 * Input: 
	 * 	- criteria:{ID hoặc UID}
	 * Output:
	 * 	- nếu thành công trả về user info
	 * 	- nếu thất bại quăng về error
	 */
	GetUserDetails:function(criteria)
	{
		var error=new Error("GetUserDetails.Error");
		var whereClause={};
		function Validation()
		{
			var q=$q.defer();
			
			try
			{
				if(o.checkData(criteria.ID)){
					whereClause.ID=criteria.ID;
				}
				else if(o.checkData(criteria.UID))
				{
					whereClause.UID=criteria.UID;
				}
				else
				{
					error.pushError("Params.notProvided");
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
		console.log(">>>>>>>>>>>>>>>>>>>>>",whereClause);
		return Validation()
		.then(function(data){
			return UserAccount.findOne()
			.where(whereClause)
			.then(function(user){
				console.log(user);
				return user;
			},function(err){
				console.log(err);
				error.pushError("userAccount.queryError");
				throw error;
			})
		},function(err){
			throw err;
		});
	},

	/**
	 * GetUserDetails: lấy thông tin user và image của user đó thông qua ID hoặc UID của user đó
	 * Input: 
	 * 	- criteria:{ID hoặc UID}
	 * Output:
	 * 	- nếu thành công trả về user info+image của user đó
	 * 	- nếu thất bại quăng về error
	 */
	GetUserDetailsWithImages:function(criteria)
	{
		var error=new Error("GetUserDetails.Error");
		var whereClause={};
		function Validation()
		{
			var q=$q.defer();
			
			try
			{
				if(o.checkData(criteria.ID)){
					whereClause.ID=criteria.ID;
				}
				else if(o.checkData(criteria.UID))
				{
					whereClause.UID=criteria.UID;
				}
				else
				{
					error.pushError("Params.notProvided");
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
			return UserAccount.findOne()
			.populate('images')
			.where(whereClause)
			.then(function(user){
				return user;
			},function(err){
				console.log(err);
				error.pushError("userAccount.queryError");
				throw error;
			})
		},function(err){
			throw err;
		});
	}
}