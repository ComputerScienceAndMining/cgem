/*
 * Controller for SampleTypes
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SampleTypesIndexCtrl ($log) {
    $log.debug('SampleTypesIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypesIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_types.index', [])
    .controller('SampleTypesIndexCtrl', SampleTypesIndexCtrl)
})();
