;(function () {
  "use strict";

  // Define controller
  function AppCtrl ($log) {
    $log.debug('AppCtrl: Hi')
    var vm = this
  }

  // Inject dependencies
  AppCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.application', [])
    .controller('AppCtrl', AppCtrl)
})();
