/*
 * Controller for TestTypes
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function TestTypesShowCtrl ($log) {
    $log.debug('TestTypesShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypesShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_types.show', [])
    .controller('TestTypesShowCtrl', TestTypesShowCtrl)
})();
