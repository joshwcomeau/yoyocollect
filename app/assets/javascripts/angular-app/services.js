angular
	.module('app.services', [])
	.factory('APIservice', function($http) {
		var API = {};

		API.getYoyos = function() {
			return $http({
				method: 'GET',
				url: '/api/yoyos'
			});
		}

		return API;
	})