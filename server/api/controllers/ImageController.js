/**
 * ImageController
 *
 * @description :: Server-side logic for managing Images
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var path=require('path');
module.exports = {
	_config: {
		actions: false,
		shortcuts: false,
		rest: false
	},

	ImageUpload:function(req,res)
	{
		req.file('avatar').upload({
			dirname: path.join(sails.config.appPath,'/assets/images')
		},function (err, uploadedFiles) {
			// if (err) return res.negotiate(err);
			
			if (err) return res.serverError(err);
			ImageService.SaveImages(uploadedFiles,{Description:req.body.Description})
			.then(function(data){
				return res.ok(data);
			},function(err){
				return res.serverError(ErrorWrap(err));
			})
			// return res.json({
			// 	message: uploadedFiles.length + ' file(s) uploaded successfully!'
			// });
		});
	}
};

