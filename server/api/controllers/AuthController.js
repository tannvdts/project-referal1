/**
 * AuthController
 *
 * @description : Controller for authentication
 */

var passport = require('passport');
var jwt = require('jsonwebtoken');
var secret = 'ewfn09qu43f09qfj94qf*&H#(R';

module.exports = {

	_config: { // cấu hình blueprint
        actions: false, //khong sử dụng action route 
        shortcuts: false,// không sử dụng shortcuts route
        rest: false// không sử dụng rest route
    },

    /**
     * login: function xử lý login
     */
    login: function(req, res) {
        console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>LOGIN");
        passport.authenticate('local', function(err, user, info) 
        {
            if ((err) || (!user)) 
            {
                if(!err) 
                {
                    var err=info;
                }
                return res.unauthor(ErrorWrap(err));
            }

            req.logIn(user, function(err) 
            {
                if (err) 
                {
                    res.unauthor(ErrorWrap(err));
                }
                else
                {
                    //tạo token
                    var token = jwt.sign(user, secret, { expiresIn:24*60*60});
                    res.ok({
                        status:'success',
                        message: info.message,
                        user: user,
                        token:token
                    });
                }
                
            });

        })(req, res);
    },

    /**
     * logout: xử lý logout
     */
    logout: function(req, res) {
        req.logout();
        res.ok({status:'success'});
    },
    
};

