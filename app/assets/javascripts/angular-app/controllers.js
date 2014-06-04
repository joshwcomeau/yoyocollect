angular
	.module("app.controllers", [])

	// Library Controller (Yoyo Index)
	.controller('libraryController', function($scope, $location, APIservice) {
		$scope.yoyoList = [];

		APIservice.getYoyos().success(function(response) {
			$scope.yoyoList = response;
		});

		// Click function to show details for a yoyo.
		$scope.loadDetails = function(idnum) {
			$location.path('/library/'+idnum);
		}
	})

	// Yoyo Controller (Yoyo Show)
	.controller('yoyoController', function($scope, $routeParams, APIservice) {
		$scope.id = $routeParams.id;

		APIservice.getYoyoInfo($scope.id).success(function(response) {
			$scope.yoyo = response;
		});
	});