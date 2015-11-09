/**
 * ImageController
 *
 * @description :: Server-side logic for managing Images
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var path=require('path');
var o=require("../services/HelperService");
var fs=require("fs");

module.exports = {
	_config: {
		actions: false,
		shortcuts: false,
		rest: false
	},

	ImagesUpload:function(req,res)
	{
		var postData=req.body;
		var fileDetails={};
		req.file('avatar').upload({
			dirname: path.join(o.getImgPathRefix(),'/assets/images'),
			maxBytes:o.const.maxImageSize,
		},function (err, uploadedFiles) {
			if (err) return res.serverError(err);
			if(!o.isValidImagesType(uploadedFiles))
			{
				var error=new Error("ImagesUpload.Error");
				error.pushError("image.invalidType");
				error.pushError({onlyAccept:o.const.allowTypes});
				return res.badRequest(ErrorWrap(error));
			}
			//console.log(uploadedFiles)
			if(o.checkData(postData.UserAccountID))
				fileDetails.UserAccountID=postData.UserAccountID;
			else if(o.checkData(req.user))
			{
				fileDetails.UserAccountID=req.user.ID;
			}
			fileDetails.Description=postData.Description;
			ImageService.SaveImages(uploadedFiles,fileDetails)
			.then(function(data){
				return res.ok(data);
			},function(err){
				return res.serverError(ErrorWrap(err));
			})
		});
	},

	ImageUpload:function(req,res)
	{
		var postData=req.body;
		var fileDetails={};
		req.file('avatar').upload({
			dirname: path.join(o.getImgPathRefix(),'/assets/images'),
			maxBytes:o.const.maxImageSize,
		},function (err, uploadedFiles) {			
			if (err) return res.serverError(err);
			if(!o.isValidImagesType(uploadedFiles))
			{
				var error=new Error("ImageUpload.Error");
				error.pushError("image.invalidType");
				error.pushError({onlyAccept:o.const.allowTypes});
				return res.badRequest(ErrorWrap(error));
			}
			// console.log(uploadedFiles)
			if(o.checkData(postData.UserAccountID))
				fileDetails.UserAccountID=postData.UserAccountID;
			else if(o.checkData(req.user))
			{
				fileDetails.UserAccountID=req.user.ID;
			}
			fileDetails.Description=postData.Description;
			fileDetails.FileNameAs=postData.FileNameAs;
			ImageService.SaveImage(uploadedFiles[0],fileDetails)
			.then(function(data){
				return res.ok(data);
			},function(err){
				return res.serverError(ErrorWrap(err));
			})
		});
	},

	DownloadImage:function(req,res)
	{
		var criteria=req.query;
		ImageService.GetImageDetails(criteria)
		.then(function(imageInfo){
			if(o.checkData(imageInfo))
			{
				var fullPath=path.join(o.getImgPathRefix(),imageInfo.FileLocation);
				console.log("===========>fullPath:",fullPath);
				fs.exists(fullPath, function(exists){
			        if(!exists)
			        {
			            var error=new Error("DownloadImage.fileNotExist");
			            return res.notFound(ErrorWrap(error));
			        }
			        res.download(fullPath,imageInfo.FileName);
			    });
			}
			else
			{
				var error=new Error("DownloadImage.imageNotFound");
				res.notFound(error);
			}
			// res.ok(imageInfo);
		},function(err){
			res.serverError(ErrorWrap(err));
		});
	}
};

