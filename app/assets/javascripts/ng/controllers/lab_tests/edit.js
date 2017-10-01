/*
 * Controller for LabTests
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function LabTestsEditCtrl ($log) {
    $log.debug('LabTestsEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  LabTestsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.edit', [])
    .controller('LabTestsEditCtrl', LabTestsEditCtrl)
})();
