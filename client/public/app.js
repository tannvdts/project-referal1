var app = angular.module('myApp', [
    'ngCookies',
    'app.controller'
]);

app.config(function($httpProvider){
    $httpProvider.interceptors.push(function($cookies) {
        return {
            'request': function(config) {
                config.headers = config.headers || {};
                if ($cookies.get('token')) {
                    config.headers.Authorization = 'Bearer '+($cookies.get('token') || '');
                }
                return config;
            },
            'response': function(response) {
            // same as above
                return response;
            }
        };
    });
    $httpProvider.defaults.withCredentials = true;
    
    /*
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];*/

});