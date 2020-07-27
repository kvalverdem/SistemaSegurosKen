
var SistemaSegurosApp = angular.module("SistemaSeguros", [])
SistemaSegurosApp.controller("SegurosController", function ($scope, $http) {
    $scope.url = "http://localhost:44398/api/";
    $scope.aparecer = true;
    $scope.getCobPorPoliza = function () {
        $scope.PrecioTotal = "";
        $http.get($scope.url + 'ObtenerCoberturasPorPoliza/' + $scope.PilizaID).then(function (response) {
            $scope.coberturas = response.data;
        }, function (response) {
            // Second function handles error
           $scope.coberturas = [];
        });
        $http.get($scope.url + 'ObtenerTipoRiesgo/' + $scope.PilizaID).then(function (response) {
            $scope.CodigoTipoRiesgo = (response.data[0] == null) ? null : response.data[0].FK_TipoRiesgo;
        }, function (response) {
            // Second function handles error
            $scope.CodigoTipoRiesgo = null;
        });
    };
    $scope.loadDetailsPolizaCliente = function () {
        $http.get($scope.url + 'ObtenerTiposPolizas').then(function (response) {
            $scope.tiposPolizas = response.data;
        }, function (response) {
            // Second function handles error
            $scope.tiposPolizas = [];
        });
        $http.get($scope.url + 'ObtenerEstadosPolizas').then(function (response) {
            $scope.EstadosPolizas = response.data;
        }, function (response) {
            // Second function handles error
            $scope.EstadosPolizas = [];
        });
        $http.get($scope.url + 'ObtenerDatosPolizaCliente/' + $scope.IDPolizaCliente).then(function (response) {
            $scope.DatosPolizaCliente = response.data;

            $scope.PilizaID = $scope.DatosPolizaCliente[0].FK_IDPoliza;
            $scope.inicioVigencia = $scope.DatosPolizaCliente[0].InicioVigenciaPoliza;
            $scope.PrecioTotal = $scope.DatosPolizaCliente[0].PrecioPolizaAdquirida;
            $scope.mesesCobertura = $scope.DatosPolizaCliente[0].MesesCobertura;
            $scope.FK_IDEstado = $scope.DatosPolizaCliente[0].FK_IDEstado;
        }, function (response) {
            // Second function handles error
            $scope.DatosPolizaCliente = null;
        });
        $http.get($scope.url + 'ObtenerCoberturasPolizaCliente/' + $scope.IDPolizaCliente).then(function (response) {
            for (let i = 0; i < response.data.length; i++)
                response.data[i].Check = (parseInt(response.data[i].PorcentajeCobertura) > 0) ? true : false;
            $scope.coberturas = response.data;
        }, function (response) {
            // Second function handles error
                $scope.coberturas = null;
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
    $scope.editarPolizaCliente = function () {
        $scope.insertarObj = {
            ID_PolizaCliente: $scope.IDPolizaCliente,
            FK_IDCliente: $scope.ClienteID,
            FK_IDPoliza: $scope.PilizaID,
            InicioVigenciaPoliza: $scope.inicioVigencia,
            PrecioPolizaAdquirida: $scope.PrecioTotal,
            MesesCobertura: $scope.mesesCobertura,
            FK_IDEstado: $scope.FK_IDEstado
        };

        $http.post($scope.url + 'EditarPolizaCliente', $scope.insertarObj).then(function (response) {
            var uno = '';//$scope.coberturas = response.data;
        }, function (response) {
            // Second function handles error
            var uno = '';
        });
        $scope.coberturas.forEach(function (x) {
            x.FK_IDCobertura = x.ID_Cobertura;
            x.FK_IDPolizaPorCliente = $scope.IDPolizaCliente;
        });
        $http.post($scope.url + 'ActualizarCoberturasPoliza', JSON.stringify($scope.coberturas)).then(function (response) {
            var uno = '';//$scope.coberturas = response.data;
        }, function (response) {
            // Second function handles error
            var uno = '';
            });
    };
});