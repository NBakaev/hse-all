'use strict';
angular.module('myApp.services', ['ngRoute'])


    .service('serverRequestService', ['$q', '$http', '$rootScope',
        function ($q, $http, $rootScope) {
            $http.defaults.headers.common["Accept"] = "application/json";
            $http.defaults.headers.common["Content-Type"] = "application/json";

            var baseUrl = 'http://192.168.43.84:5000';

            // count server connection number
            $rootScope.serversConnectionsActive = 0;

            this.get = function (relUrl, params) {
                $rootScope.serversConnectionsActive++;
                var promise = $http.get(baseUrl + "/" + relUrl).then(function (response) {
                    $rootScope.serversConnectionsActive--;
                    return response.data;
                });
                // Return the promise to the controller
                return promise;
            };

            this.put = function (relUrl, object) {
                $rootScope.serversConnectionsActive++;
                var promise = $http.put(baseUrl + "/" + relUrl, object).then(function (response) {
                    $rootScope.serversConnectionsActive--;
                    return response.data;
                });
                // Return the promise to the controller
                return promise;
            };

            this.post = function (relUrl, object, params) {
                var optionsParams = {};

                if (params) {
                    if (params.responseType) optionsParams.responseType = params.responseType;
                }

                if (optionsParams.responseType) {
                    var promise = $http.post(baseUrl + "/" + relUrl, object, optionsParams).then(function (response) {
                        $rootScope.serversConnectionsActive--;
                        return response.data;
                    });

                } else {
                    var promise = $http.post(baseUrl + "/" + relUrl, object).then(function (response) {
                        $rootScope.serversConnectionsActive--;
                        return response.data;
                    });
                }

                // Return the promise to the controller
                return promise;

            };

            this.delete = function (relUrl) {
                $rootScope.serversConnectionsActive++;
                var promise = $http.delete(baseUrl + "/" + relUrl).then(function (response) {
                    $rootScope.serversConnectionsActive--;
                    return response.data;
                });

                // Return the promise to the controller
                return promise;
            };
        }])

    .factory('logger', [
        function () {
            var logIt;
            toastr.options = {
                "closeButton": true,
                "positionClass": "toast-bottom-right",
                "timeOut": "3000"
            };
            logIt = function (message, type) {
                return toastr[type](message);
            };
            return {
                log: function (message) {
                    logIt(message, 'info');
                },
                logWarning: function (message) {
                    logIt(message, 'warning');
                },
                logSuccess: function (message) {
                    logIt(message, 'success');
                },
                logError: function (message) {
                    logIt(message, 'error');
                }
            };
        }
    ])
