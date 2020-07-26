
var SistemaSegurosApp = angular.module("SistemaSeguros", [])
SistemaSegurosApp.controller("SegurosController", function ($scope, $http) {
    $scope.url = "http://localhost:44398/api/";
    $scope.getCobPorPoliza = function () {
        $http.get($scope.url + 'ObtenerCoberturasPorPoliza/' + $scope.PilizaID).then(function (response) {
            $scope.coberturas = response.data;
        }, function (response) {
            // Second function handles error
           $scope.coberturas = [];
        });
    };
    $scope.crearPolizaCliente = function () {
        $scope.insertarObj = {
            FK_IDCliente: $scope.IdClientes,
            FK_IDPoliza: $scope.PilizaID,
            InicioVigenciaPoliza: $scope.inicioVigencia,
            PrecioPolizaAdquirida: $scope.PrecioTotal,
            MesesCobertura: $scope.mesesCobertura,
            FK_IDEstado: 1
        };

        $http.post($scope.url + 'CrearNuevaPoliza', $scope.insertarObj).then(function (response) {
            var uno = '';//$scope.coberturas = response.data;
        }, function (response) {
            // Second function handles error
            var uno = '';
        });
        $scope.coberturas.forEach(function (x) {
            x.FK_IDCobertura = x.ID_Cobertura;
        });
        $http.post($scope.url + 'AsignarCoberturasPorPoliza', JSON.stringify($scope.coberturas)).then(function (response) {
            var uno = '';//$scope.coberturas = response.data;
        }, function (response) {
            // Second function handles error
            var uno = '';
        });
    };

    
});