/*
 * Controller for TestTypes
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function TestTypesEditCtrl ($log) {
    $log.debug('TestTypesEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_types.edit', [])
    .controller('TestTypesEditCtrl', TestTypesEditCtrl)
})();
