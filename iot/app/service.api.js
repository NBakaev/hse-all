angular.module('myApp.api', ['ngRoute', 'myApp.services'])
    .service('apiService', ['serverRequestService', function (serverRequestService) {

        this.isActive = function () {
            return serverRequestService.get('is_active');
        };

        this.isParty = function () {
            return serverRequestService.get('is_party');
        };

        this.whatSong = function () {
            return serverRequestService.get('what_song');
        };

        this.loudness = function () {
            return serverRequestService.get('loudness');
        };

        this.brightness = function () {
            return serverRequestService.get('brightness');
        };

        this.vibration = function () {
            return serverRequestService.get('vibration');
        };

        this.movement = function () {
            return serverRequestService.get('movement');
        };



        // this.addPoi = function (obj) {
        //     return serverRequestService.post('poi', obj);
        // };
        //
        // this.updatePoi = function (obj) {
        //     return serverRequestService.put('poi', obj);
        // };
        //
        // this.deletePoi = function (obj) {
        //     return serverRequestService.delete('poi/' + obj);
        // };
        //
        // this.searchPOIsInRadius = function (obj) {
        //     return serverRequestService.post('poi/search', obj);
        // };



    }])

