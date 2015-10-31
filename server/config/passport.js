var passport = require('passport'),
LocalStrategy = require('passport-local').Strategy,
bcrypt = require('bcrypt-nodejs'),
o = require("../api/services/HelperService");


passport.serializeUser(function(user, done) {
	console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>serializeUser");
	done(null, user.ID);
});

passport.deserializeUser(function(ID, done) {
	console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>deserializeUser");
	UserAccount.findOne({ID:ID})
	.then(function(user){

		done(null,user);
	})
	.catch(function(err){
		done(err);
	});
});

passport.use(new LocalStrategy({
		usernameField: 'UserName',
		passwordField: 'Password'
	},
	function(u, p, done) {
		UserAccount.findOne({UserName:u})
		.then(function(user){
			if (!user) {
	            var err = new Error("Authentication.userAccountNotFound");
	            return done(null, false, err);
	        }
	        if (user && user.Enable != 'Y') {
	            var err = new Error("Authentication.userAccountDisabled");
	            return done(null, false, err);
	        }

	        bcrypt.compare(p, user.Password, function(err, res) {
                if (!res) {
                    var err = new Error("Authentication.passwordInvalid");
                    return done(null, false, err);
                }
                var returnField={
                	ID:null,
					UID:null,
					UserName:null,
					Email:null,
					UserType:null,
					FirstName:null,
					LastName:null,
					Gender:null,
					DOB:null,
					Address:null,
					PhoneNumber:null,
				}
				console.log(user);
                o.rationalizeObject(user,returnField);
                console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>");
                console.log(user);
                console.log("Login success");
                return done(null, user, {
                    message: 'Logged In Successfully'
                });
            });

		})
		.catch(function(err){
			console.log(err);
			var error=new Error("Authentication.userAccountQueryError");
			return done(error);
		});
	}
));
