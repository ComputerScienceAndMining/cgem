/*
 * Controller for LabTests
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function LabTestsShowCtrl ($log) {
    $log.debug('LabTestsShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  LabTestsShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.show', [])
    .controller('LabTestsShowCtrl', LabTestsShowCtrl)
})();
