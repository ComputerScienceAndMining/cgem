/*
 * Controller for TestTypeVersions
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function TestTypeVersionsEditCtrl ($log) {
    $log.debug('TestTypeVersionsEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypeVersionsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_type_versions.edit', [])
    .controller('TestTypeVersionsEditCtrl', TestTypeVersionsEditCtrl)
})();
