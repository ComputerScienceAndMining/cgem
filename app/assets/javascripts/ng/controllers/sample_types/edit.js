/*
 * Controller for SampleTypes
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SampleTypesEditCtrl ($log) {
    $log.debug('SampleTypesEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_types.edit', [])
    .controller('SampleTypesEditCtrl', SampleTypesEditCtrl)
})();
