
var SistemaSegurosApp = angular.module("SistemaSeguros", [])
SistemaSegurosApp.controller("SegurosController", function ($scope, $http) {
    $scope.url = "http://localhost:44398/api/";
    $http.get($scope.url +'Coberturas').then(function (response) {
        $scope.coberturas = response.data;
    });
});