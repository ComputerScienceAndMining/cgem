/*
 * Controller for TestTypeVersions
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function TestTypeVersionsNewCtrl ($log) {
    $log.debug('TestTypeVersionsNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypeVersionsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_type_versions.new', [])
    .controller('TestTypeVersionsNewCtrl', TestTypeVersionsNewCtrl)
})();
