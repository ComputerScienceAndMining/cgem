/*
 * Controller for LabTests
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function LabTestsNewCtrl ($log) {
    $log.debug('LabTestsNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  LabTestsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.new', [])
    .controller('LabTestsNewCtrl', LabTestsNewCtrl)
})();
