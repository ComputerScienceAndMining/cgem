;(function () {
  "use strict";

  // Define controller
  function HomeCtrl ($log) {
    $log.debug('HomeCtrl: Hi')
    var vm = this
  }

  // Inject dependencies
  HomeCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.home', [])
    .controller('HomeCtrl', HomeCtrl)
})();
