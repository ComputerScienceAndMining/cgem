/*
 * Controller for TestStatuses
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function TestStatusesEditCtrl ($log) {
    $log.debug('TestStatusesEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestStatusesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_statuses.edit', [])
    .controller('TestStatusesEditCtrl', TestStatusesEditCtrl)
})();
