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
				image.FileLocation=path.join(o.const.imageLocation,actualFileName);
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
			});
		},function(err){
			throw err;
		})
	}
}