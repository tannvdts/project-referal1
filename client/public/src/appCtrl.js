var app = angular.module('app.controller',[]);

app.controller('appCtrl', function($scope,$http,$cookies) {

    //Cờ xác định login thành công hay chưa
    $scope.loggedIn=false;
    var baseUrl="http://localhost:1337";
    function makeUrl(api)
    {
        return baseUrl+"/"+api;
    }
    /**
     * login: xử lý login
     */
	$scope.login=function(){
		$http({
            method:"POST",
            url:makeUrl('api/auth/login'),
            data:{UserName:$scope.UserName,Password:$scope.Password}
        })
        .then(function(res){
            alert("Login thành công: "+JSON.stringify(res.data));
            $cookies.putObject('user',res.data.user);
            $cookies.put('token',res.data.token);
            $scope.loggedIn=true;
        },function(err){
            alert("login thất bại: "+JSON.stringify(err));
        })
	}


    /**
     * logout: xử lý logout
     */
    $scope.logout=function()
    {
        $http({
            method:"GET",
            url:makeUrl("api/auth/logout"),
        })
        .then(function(res){
            alert("logout success");
            // $cookies.putObject('user',null);
            // $cookies.put('token',null);
            $scope.loggedIn=false;
        },function(err){
            alert("logout thất bại: "+JSON.stringify(err));   
        })
    }

    /**
     * test: ham kiem tra token
     */
    $scope.testAuthenticated=function()
    {
        $http({
            method:"GET",
            url:makeUrl('api/test/TestGet'),
            // withCredentials:true,
            // headers: {
            //     Authorization: 'Bearer '+$cookies.get('token')
            // }
        })
        .then(function(data){
            alert("Test thành công: "+JSON.stringify(data));
        },function(err){
            alert("Test thất bại: "+JSON.stringify(err));
        })
    }

    /**
     * test: hàm kiểm tra admin
     */
    $scope.testAdmin=function()
    {
        $http({
            method:"GET",
            url:"http://localhost:3000/testAdmin",
            // headers: {
            //     Authorization: 'Bearer '+($cookieStore.get('token') || '')
            // }
        })
        .success(function(data) {
            if(data.status=='success')
            {
                alert("Test thành công: "+JSON.stringify(data));
            }
            else
            {
                alert("Test thất bại: "+JSON.stringify(data));
            }
        })
        .error(function (data) {
            alert("Test thất bại: "+JSON.stringify(data));
        })
    }
});