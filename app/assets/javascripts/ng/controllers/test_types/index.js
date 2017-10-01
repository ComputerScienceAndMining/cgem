/*
 * Controller for TestTypes
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function TestTypesIndexCtrl ($log) {
    $log.debug('TestTypesIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypesIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_types.index', [])
    .controller('TestTypesIndexCtrl', TestTypesIndexCtrl)
})();
