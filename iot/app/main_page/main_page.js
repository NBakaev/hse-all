'use strict';

angular.module('myApp.view1', ['ngRoute'])

    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider.when('/main_page', {
            templateUrl: 'app/main_page/index.html',
            controller: 'mainPageController'
        })
    }])

    .controller('mainPageController', ['$scope', '$rootScope', 'apiService',  'logger',
        function ($scope, $rootScope, apiService, logger) {

            $scope.data = {isActive: 'unknown', isParty: 'unknown', whatSong:'unknown', loudness:'unknown', brightness:'unknown', vibration:'unknown', movement:'unknown'};
            $scope.data.log = "";
            $scope.data.isPartyDetectedTimes = 0;

            $scope.updateTick = function () {
                // apiService.isActive().then(function (data) {
                //     $scope.data.isActive = data.answer;
                //     $scope.data.log+="is active: " + data.answer;
                //     $scope.$applyAsync();
                // });

                $scope.data.log+="\r\n Date: " + new Date().toDateString() + "; \r\n";

                apiService.isParty().then(function (data) {
                    $scope.data.isParty = data.answer;
                    $scope.data.log+="isParty: " + data.answer + "; \r\n";
                    if (data.answer ==='yes'){
                        $scope.data.isPartyDetectedTimes++;
                    }
                    $scope.$applyAsync();
                });

                apiService.whatSong().then(function (data) {
                    $scope.data.whatSong = data.answer;
                    $scope.data.log+="whatSong: " + data.answer + "; \r\n";
                    $scope.$applyAsync();});

                apiService.loudness().then(function (data) {
                    $scope.data.loudness = data.answer;
                    $scope.data.log+="loudness: " + data.answer + "; \r\n";
                    $scope.$applyAsync();});

                apiService.brightness().then(function (data) {
                    $scope.data.brightness = data.answer;
                    $scope.data.log+="brightness: " + data.answer + "; \r\n";
                    $scope.$applyAsync();});

                apiService.vibration().then(function (data) {
                    $scope.data.vibration = data.answer;
                    $scope.data.log+="vibration: " + data.answer + "; \r\n";
                    $scope.$applyAsync();});

                // apiService.movement().then(function (data) {
                //     $scope.data.movement = data.answer;
                //     $scope.data.log+="movement: " + data.answer;
                //     $scope.$applyAsync();});
            };
            $scope.updateTick();
            window.setInterval(function(){
                $scope.updateTick();
            }, 300);


        }]);