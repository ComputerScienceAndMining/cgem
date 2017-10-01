/*
 * Controller for TestStatuses
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function TestStatusesShowCtrl ($log) {
    $log.debug('TestStatusesShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestStatusesShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_statuses.show', [])
    .controller('TestStatusesShowCtrl', TestStatusesShowCtrl)
})();
