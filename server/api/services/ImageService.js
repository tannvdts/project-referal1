var $q=require("q");
var o=require("./HelperService");
var path=require('path');
module.exports={
	SaveImages:function(images,info)
	{
		console.log(images)
		var error=new Error("SaveImages.Error");
		function Validation()
		{
			var q=$q.defer();
			try
			{
				if(!_.isArray(images) || _.isEmpty(images))
				{
					error.pushError("images.empty");
					throw error;

				}
				if(!_.isObject(info) || _.isEmpty(info))
				{
					info={};
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
			var inserts=[];
			for(var i=0;i<images.length;i++)
			{
				var image={};
				image.UID=o.createUid();
				image.FileName=images[i].filename;
				//get actual file location
				var fdPart=images[i].fd.split('\\');
				var actualFileName=fdPart[fdPart.length-1];
				image.FileLocation=path.join(o.const.imgLocation,actualFileName);
				//------------------------
				image.Description=info.Description;
				inserts.push(image);
			}
			return Image.create(inserts)
			.then(function(data){
				return data;
			},function(err){
				o.exlog(err);
				error.pushError("images.insertsError");
				throw error;
			});
		},function(err){
			throw err;
		})
	},

	SaveImage:function(image,info)
	{
		var error=new Error("SaveImage.Error");
		function Validation()
		{
			var q=$q.defer();
			try
			{
				if(!_.isObject(image) ||_.isEmpty(image))
				{
					error.pushError("image.empty");
					throw error;
				}
				if(!_.isObject(info) || _.isEmpty(info))
				{
					info={};
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
			var insert={};
			insert.UID=o.createUid();
			insert.FileName=info.FileNameAs||image.filename;
			//get actual file location
			var fdPart=image.fd.split('\\');
			var actualFileName=fdPart[fdPart.length-1];
			insert.FileLocation=path.join(o.const.imgLocation,actualFileName);
			//------------------------
			image.Description=info.Description;
			return Image.create(insert)
			.then(function(data){
				return data;
			},function(err){
				o.exlog(err);
				error.pushError("image.insertError");
				throw error;
			})
		},function(err){
			throw err;
		})
	},

	GetImageDetails:function(criteria)
	{
		var error=new Error("GetImageDetails.Error");
		var whereClause={};
		function Validation()
		{
			var q=$q.defer();
			try
			{
				if(!_.isObject(criteria) || _.isEmpty(criteria))
				{
					error.pushError("params.notProvided");
					throw error;
				}
				if(o.checkData(criteria.ID))
				{
					whereClause.ID=criteria.ID;
				}
				else if(o.checkData(criteria.UID))
				{
					whereClause.UID=criteria.UID;
				}
				else
				{
					error.pushError("params.invalid");
					throw error;
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
			return Image.findOne()
			.where(whereClause)
			.then(function(image){
				return image;
			},function(err){
				o.exlog(err);
				error.pushError("image.queryError");
				throw error;				
			})
		},function(err){
			throw err;
		})
	}
}