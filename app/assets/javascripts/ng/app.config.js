;(function () {
  'use strict'

  angular.module('app')
  .config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.withCredentials = true
  }])

  angular.element().ready(function() {
    angular.resumeBootstrap([window.app['name']])
  })
})();
