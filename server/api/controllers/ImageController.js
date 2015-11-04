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
		req.file('avatar').upload({
			dirname: path.join(o.getImgPathRefix(),'/assets/images')
		},function (err, uploadedFiles) {
			if (err) return res.serverError(err);
			ImageService.SaveImages(uploadedFiles,{Description:req.body.Description})
			.then(function(data){
				return res.ok(data);
			},function(err){
				return res.serverError(ErrorWrap(err));
			})
		});
	},

	ImageUpload:function(req,res)
	{
		req.file('avatar').upload({
			dirname: path.join(o.getImgPathRefix(),'/assets/images')
		},function (err, uploadedFiles) {
			if (err) return res.serverError(err);
			ImageService.SaveImage(uploadedFiles[0],{Description:req.body.Description,FileNameAs:req.body.FileNameAs})
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

