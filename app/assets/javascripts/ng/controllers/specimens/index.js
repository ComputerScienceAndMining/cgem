/*
 * Controller for Specimens
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SpecimensIndexCtrl ($log) {
    $log.debug('SpecimensIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimensIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.index', [])
    .controller('SpecimensIndexCtrl', SpecimensIndexCtrl)
})();
