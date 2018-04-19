var app = angular.module("SeptimoMar", ["ngRoute"]);

app.config(function($routeProvider) {

    $j = jQuery.noConflict();

    $routeProvider
    .when("/", {
        templateUrl : "html/personaje/formPersonaje.html",
        controller: "personajeNuevoCtrl"
    })
    /*$routeProvider
    .when("/", {
        templateUrl : "html/login.html",
        controller: "loginCtrl"
    })
    .when("/personajes/nuevo", {
        templateUrl : "html/personaje/formPersonaje.html",
        controller: "personajeNuevoCtrl"
    })*/
});

app.controller("menuAppCtrl", ['$scope', '$location', function($scope, $location) {


}]);