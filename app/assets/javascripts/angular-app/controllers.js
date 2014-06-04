angular
	.module("app.controllers", [])
	.controller('libraryController', function($scope, APIservice) {
		$scope.yoyoList = [];

		APIservice.getYoyos().success(function(response) {
			$scope.yoyoList = response;
		});
	});