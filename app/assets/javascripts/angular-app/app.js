angular
  .module('app', [
		'ngRoute', 
		'ngResource',
		'app.services',
		'app.controllers'
	])
	.config(['$routeProvider', function($routeProvider) {
		$routeProvider
			.when("/library", 		{ templateUrl: "partials/library.html", controller: "libraryController" })
			.when("/library/new",	{ templateUrl: "partials/newyoyo.html", controller: "newYoyoController" })
			.when("/library/:id", { templateUrl: "partials/yoyo.html", 		controller: "yoyoController"})
			.otherwise({redirectTo: "/library"});
	}]);