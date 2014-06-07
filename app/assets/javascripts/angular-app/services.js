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

		API.getYoyoInfo = function(idnum) {
			return $http({
				method: 'GET',
				url: '/api/yoyos/'+ idnum
			})
		}

		API.getManufacturers = function() {
			return $http({
				method: 'GET',
				url: '/api/manufacturers'
			})
		}

		API.createYoyo = function(postData) {
			return $http({
				method: 'POST',
				data: postData,
				url: '/api/yoyos'
			})
		}

		API.createUser = function(postData) {
			return $http({
				method: 'POST',
				data: {
					user: postData
				},
				url: '/api/users'
			})
		}

		return API;
	})