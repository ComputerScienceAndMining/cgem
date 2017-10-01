/*
 * Controller for LabTests
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function LabTestsIndexCtrl ($log) {
    $log.debug('LabTestsIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  LabTestsIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.index', [])
    .controller('LabTestsIndexCtrl', LabTestsIndexCtrl)
})();
