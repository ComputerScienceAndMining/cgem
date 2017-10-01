/*
 * Controller for TestTypeVersions
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function TestTypeVersionsShowCtrl ($log) {
    $log.debug('TestTypeVersionsShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypeVersionsShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_type_versions.show', [])
    .controller('TestTypeVersionsShowCtrl', TestTypeVersionsShowCtrl)
})();
