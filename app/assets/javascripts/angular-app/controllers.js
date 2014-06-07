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

		// Click function to add a new yoyo to the library 
		// (I'll need to add auth to this at some point)
		$scope.newYoyo = function() {
			$location.path('/library/new');
		}
	})


	// Yoyo Controller (Yoyo Show)
	.controller('yoyoController', function($scope, $routeParams, APIservice) {
		$scope.id = $routeParams.id;

		APIservice.getYoyoInfo($scope.id).success(function(response) {
			$scope.yoyo = response;
		});
	})


	// NewYoyo Controller (Yoyo New/Create)
	.controller('newYoyoController', function($scope, APIservice) {
		// Load manufacturer list
		APIservice.getManufacturers().success(function(response) {
			$scope.manufacturers = response;
		});

		// Send AJAX post request to create yoyo
		$scope.submitYoyo = function() {
			var postData = $scope.yoyo;
			APIservice.createYoyo(postData)
			.success(function(response) {
				$scope.submitStatus = "Success! Yoyo has been added to DB.";
			}).error(function(response, status) {
				$scope.submitStatus = "Error: " + status;
			});
		}
	})


	.controller('userController', function($scope, APIservice) {
		$scope.submitRegistration = function() {
			var postData = $scope.user
			APIservice.createUser(postData)
			.success(function(response) {
				$scope.submitStatus = "Success! You are now registered.";
			}).error(function(response, status) {
				$scope.submitStatus = "Error: " + status;
			});
		}
	});