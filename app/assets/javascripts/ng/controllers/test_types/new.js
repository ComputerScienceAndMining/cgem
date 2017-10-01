/*
 * Controller for TestTypes
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function TestTypesNewCtrl ($log) {
    $log.debug('TestTypesNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_types.new', [])
    .controller('TestTypesNewCtrl', TestTypesNewCtrl)
})();
