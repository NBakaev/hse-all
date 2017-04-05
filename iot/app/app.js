'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
    'ngRoute',
    'myApp.view1',
    'myApp.services',
    'myApp.api',
    // 'myApp.account',
    // 'ngMaterial',
    // 'angularUtils.directives.dirPagination',
    // 'LocalStorageModule',
    // 'angular-loading-bar',
    // 'angularFileUpload',
    // 'monospaced.qrcode',
    // 'textAngular'

]).config(['$routeProvider',   '$httpProvider', '$sceDelegateProvider',
    function ($routeProvider, $httpProvider, $sceDelegateProvider) {
    $routeProvider.otherwise({redirectTo: '/main_page'});
    // paginationTemplateProvider.setPath('bower_components/angularUtils-pagination/dirPagination.tpl.html');
    // $httpProvider.interceptors.push('authHttpResponseInterceptor');

}]);
